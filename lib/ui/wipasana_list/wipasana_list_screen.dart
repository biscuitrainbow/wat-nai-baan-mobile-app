import 'package:buddish_project/constants.dart';
import 'package:buddish_project/data/model/video.dart';
import 'package:buddish_project/data/repository/youtube_repository.dart';
import 'package:buddish_project/ui/sermon_video/video_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

class WipasanaListScreen extends StatefulWidget {
  static final String route = '/wipasana';

  final List<Video> wipasanaVideos = Video.getWipasanaVideos();

  @override
  _WipasanaListScreenState createState() => _WipasanaListScreenState();
}

class _WipasanaListScreenState extends State<WipasanaListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        title: Text(
          'วิปัสสนากรรมฐาน',
          style: AppStyle.appbarTitle,
        ),
        iconTheme: IconThemeData(color: AppColors.primary),
      ),
      body: Column(
        children: <Widget>[
          _buildVideoList(),
        ],
      ),
    );
  }

  Expanded _buildVideoList() {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.only(top: Dimension.screenVerticalPadding),
        itemBuilder: (context, index) {
          final video = widget.wipasanaVideos[index];
          return _buildVideoItem(video);
        },
        itemCount: widget.wipasanaVideos.length,
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
