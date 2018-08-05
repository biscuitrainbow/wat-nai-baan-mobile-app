import 'package:buddish_project/data/model/Video.dart';
import 'package:buddish_project/data/repository/youtube_repository.dart';

class VideoParser {
  static List<Video> parse(List<dynamic> json) {
    var videos = json.map((video) {
      return Video(
        id: video[YoutubeRepository.fieldSnippet][YoutubeRepository.fieldResourceId][YoutubeRepository.fieldVideoId],
        name: video[YoutubeRepository.fieldSnippet][YoutubeRepository.fieldTitle],
        thumbnailUrl: video[YoutubeRepository.fieldSnippet][YoutubeRepository.fieldThumbnail][YoutubeRepository.fieldMedium][YoutubeRepository.fieldUrl],
      );
    }).toList();

    return videos;
  }
}
