import 'dart:async';
import 'dart:convert';

import 'package:buddish_project/.env.dart';
import 'package:buddish_project/data/model/video.dart';
import 'package:buddish_project/data/parser/video_parser.dart';
import 'package:buddish_project/data/repository/constant.dart';
import 'package:http/http.dart' as http;

class YoutubeRepository {
  static final String apiKey = 'AIzaSyBxgAhxvcjJukJITMAUiaLHJtMLQF9qUrQ';

  static final String fieldItems = 'items';
  static final String fieldSnippet = 'snippet';
  static final String fieldResourceId = 'resourceId';
  static final String fieldVideoId = 'videoId';
  static final String fieldTitle = 'title';
  static final String fieldId = 'id';
  static final String fieldThumbnail = 'thumbnails';
  static final String fieldMedium = 'medium';
  static final String fieldUrl = 'url';

  Future<List<Video>> fetchVideosFromPlaylist(String playlistId) async {
    final response = await http.get('https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&maxResults=50&playlistId=$playlistId&key=$apiKey');
    final jsonResponse = json.decode(response.body);

    final videos = VideoParser.parse(jsonResponse[fieldItems]);
    return videos;
  }
}
