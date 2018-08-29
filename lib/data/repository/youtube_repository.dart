import 'dart:async';
import 'dart:convert';

import 'package:buddish_project/data/model/video.dart';
import 'package:buddish_project/data/parser/video_parser.dart';
import 'package:http/http.dart' as http;

class YoutubeRepository {
  static final String apiKey = 'AIzaSyBxgAhxvcjJukJITMAUiaLHJtMLQF9qUrQ';

  Future<List<Video>> fetchVideosFromPlaylist(String playlistId) async {
    final response = await http.get('https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&maxResults=50&playlistId=$playlistId&key=$apiKey');
    final jsonResponse = json.decode(response.body);

    final videos = VideoParser.parse(jsonResponse[VideoField.items]);
    return videos;
  }
}
