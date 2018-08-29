import 'package:buddish_project/constants.dart';
import 'package:buddish_project/data/model/video.dart';
import 'package:buddish_project/data/repository/youtube_repository.dart';
import 'package:buddish_project/ui/common/filter_bar.dart';
import 'package:buddish_project/ui/sermon_video/sermon_video_container.dart';
import 'package:buddish_project/ui/sermon_video/video_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SermonVideoScreen extends StatefulWidget {
  static final String route = '/sermonVideos';

  final SermonVideoViewModel viewModel;

  SermonVideoScreen({
    this.viewModel,
  });

  @override
  _SermonVideoScreenState createState() => _SermonVideoScreenState();
}

class _SermonVideoScreenState extends State<SermonVideoScreen> {
  List<String> selectedCategories = [];

  List<Video> _getFilterVideos() {
    if (selectedCategories.isEmpty) {
      return widget.viewModel.state.videos;
    }

    return widget.viewModel.state.videos.where((Video video) => video.isInCategories(selectedCategories)).toList();
  }

  Widget _buildAppBar() {
    return AppBar(
      elevation: 1.0,
      title: Text(
        'ฟังเทศน์ ฟังธรรม',
        style: AppStyle.appbarTitle,
      ),
      iconTheme: IconThemeData(color: AppColors.main),
    );
  }

  Widget _buildFilter() {
    return Expanded(
      flex: 2,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 8.0,
        ),
        child: Row(
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Icon(FontAwesomeIcons.filter, size: 16.0, color: Colors.black54),
                  SizedBox(width: 4.0),
                  Text('หมวดหมู่', style: TextStyle(color: Colors.black54)),
                ],
              ),
            ),
            SizedBox(width: Dimension.screenHorizonPadding),
            FilterBar(
              items: Video.category,
              textColor: Colors.black,
              backgroundColor: Colors.white,
              activeTextColor: Colors.white,
              activeBackgroundColor: AppColors.main,
              onChanged: (selected) {
                setState(() => selectedCategories = selected);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: <Widget>[
          _buildFilter(),
          _buildVideoList(),
        ],
      ),
    );
  }

  Expanded _buildVideoList() {
    return Expanded(
      flex: 13,
      child: ListView.builder(
        itemBuilder: (context, index) {
          final video = _getFilterVideos()[index];
          return _buildVideoItem(video);
        },
        itemCount: _getFilterVideos().length,
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
