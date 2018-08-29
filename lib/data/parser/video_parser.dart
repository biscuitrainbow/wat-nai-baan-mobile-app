import 'package:buddish_project/data/model/video.dart';

class VideoParser {
  static List<Video> parse(List<dynamic> json) {
    var videos = json.map((video) {
      return Video(
        id: video[VideoField.snippet][VideoField.resourceId][VideoField.videoId],
        title: video[VideoField.snippet][VideoField.title],
        thumbnailUrl: video[VideoField.snippet][VideoField.thumbnail][VideoField.medium][VideoField.url],
      );
    }).toList();

    return videos;
  }
}

abstract class VideoField {
  static final String items = 'items';
  static final String snippet = 'snippet';
  static final String resourceId = 'resourceId';
  static final String videoId = 'videoId';
  static final String title = 'title';
  static final String id = 'id';
  static final String thumbnail = 'thumbnails';
  static final String medium = 'medium';
  static final String url = 'url';
}
