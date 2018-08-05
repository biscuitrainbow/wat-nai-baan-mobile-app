import 'package:buddish_project/constants.dart';
import 'package:buddish_project/data/model/Video.dart';
import 'package:buddish_project/data/repository/youtube_repository.dart';
import 'package:buddish_project/ui/common/loading_content.dart';
import 'package:buddish_project/ui/common/loading_view.dart';
import 'package:buddish_project/ui/sermon_video/sermon_video_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: Style.appbarTitleStyle,
        ),
        iconTheme: IconThemeData(color: AppColors.main),
      ),
      body: LoadingView(
        loadingStatus: widget.viewModel.state.loadingStatus,
        initialContent: ListView(
          padding: EdgeInsets.symmetric(vertical: Dimension.fieldVerticalMargin),
          children: _buildVideoItem(),
        ),
        loadingContent: LoadingContent(
          text: 'กำลังโหลด',
        ),
      ),
    );
  }

  void _showVideo(String videoId) {
    FlutterYoutube.playYoutubeVideoByUrl(
      apiKey: YoutubeRepository.apiKey, videoUrl: 'https://www.youtube.com/watch?v=$videoId', fullScreen: false, //default false
    );
  }

  List<Widget> _buildVideoItem() {
    return widget.viewModel.state.videos
        .map(
          (Video video) => VideoItem(
                video: video,
                onPressed: () => _showVideo(video.id),
              ),
        )
        .toList();
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
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
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
