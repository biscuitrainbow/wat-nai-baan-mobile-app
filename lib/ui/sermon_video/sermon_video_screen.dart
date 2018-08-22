import 'package:buddish_project/constants.dart';
import 'package:buddish_project/data/loading_status.dart';
import 'package:buddish_project/data/model/video.dart';
import 'package:buddish_project/data/repository/youtube_repository.dart';
import 'package:buddish_project/ui/common/loading_content.dart';
import 'package:buddish_project/ui/sermon_video/sermon_video_container.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:shimmer/shimmer.dart';

class SermonVideoScreen extends StatefulWidget {
  final SermonVideoViewModel viewModel;
  final String title;

  SermonVideoScreen({
    this.title,
    this.viewModel,
  });

  @override
  _SermonVideoScreenState createState() => _SermonVideoScreenState();
}

class _SermonVideoScreenState extends State<SermonVideoScreen> {
  Widget _buildAppBar() {
    return SliverAppBar(
      snap: true,
      floating: true,
      elevation: 1.0,
      forceElevated: true,
      title: Text(
        widget.title,
        style: AppStyle.appbarTitle,
      ),
      iconTheme: IconThemeData(color: AppColors.main),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildAppBar(),
          widget.viewModel.state.loadingStatus == LoadingStatus.loading
              ? SliverFillRemaining(
                  child: LoadingContent(
                    text: 'กำลังโหลด',
                  ),
                )
              : SliverPadding(
                  padding: EdgeInsets.only(top: Dimension.screenVerticalPadding),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        final video = widget.viewModel.state.videos[index];
                        return _buildVideoItem(video);
                      },
                      childCount: widget.viewModel.state.videos.length,
                    ),
                  ),
                )
        ],
      ),
    );
  }

  void _showVideo(String videoId) {
    FlutterYoutube.playYoutubeVideoByUrl(
      apiKey: YoutubeRepository.apiKey, videoUrl: 'https://www.youtube.com/watch?v=$videoId', fullScreen: false, autoPlay: true, //default false
    );
  }

  Widget _buildVideoItem(Video video) {
    return VideoItem(video: video, onPressed: () => _showVideo(video.id));
  }
}

class VideoItem extends StatelessWidget {
  final Video video;
  final VoidCallback onPressed;

  VideoItem({
    this.video,
    this.onPressed,
  });

  Widget _buildImagePlaceholder() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: 180.0,
        width: 320.0,
        color: Colors.grey,
      ),
    );
  }

  Widget _buildVideoTitle() {
    return Row(children: <Widget>[
      Expanded(
        child: Text(
          video.name,
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: AppColors.main),
        ),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: Dimension.screenHorizonPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: video.thumbnailUrl,
              placeholder: _buildImagePlaceholder(),
            ),
            SizedBox(height: 4.0),
            _buildVideoTitle(),
            SizedBox(height: 28.0),
          ],
        ),
      ),
    );
  }
}
