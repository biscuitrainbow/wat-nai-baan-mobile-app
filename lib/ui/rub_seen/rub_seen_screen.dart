import 'package:buddish_project/constants.dart';
import 'package:buddish_project/data/model/video.dart';
import 'package:buddish_project/data/repository/youtube_repository.dart';
import 'package:buddish_project/ui/sermon_video/video_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

class RubSeenScreen extends StatefulWidget {
  static final String route = '/rubseen';

  final List<Video> rubSeenVideos = Video.getRubSeenVideos();

  @override
  _RubSeenScreenState createState() => _RubSeenScreenState();
}

class _RubSeenScreenState extends State<RubSeenScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: <Widget>[
          _buildVideoList(),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      elevation: 1.0,
      title: Text(
        'อาราธนาศีล',
        style: AppStyle.appbarTitle,
      ),
      iconTheme: IconThemeData(color: AppColors.primary),
    );
  }

  Expanded _buildVideoList() {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.only(top: Dimension.screenVerticalPadding),
        itemBuilder: (context, index) {
          final video = widget.rubSeenVideos[index];
          return _buildVideoItem(video);
        },
        itemCount: widget.rubSeenVideos.length,
      ),
    );
  }

  void _showVideo(String videoId) {
    FlutterYoutube.playYoutubeVideoByUrl(
      apiKey: YoutubeRepository.apiKey,
      videoUrl: 'https://www.youtube.com/watch?v=$videoId',
      fullScreen: false,
      autoPlay: true,
    );
  }

  Widget _buildVideoItem(Video video) {
    return VideoItem(video: video, onPressed: () => _showVideo(video.id));
  }
}
