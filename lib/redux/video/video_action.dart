import 'dart:async';

import 'package:buddish_project/data/model/video.dart';

class FetchSermonPlaylist {
  final String playlistId;
  final Completer<Null> completer;

  FetchSermonPlaylist(this.playlistId, this.completer);
}

class FetchSermonPlaylistSuccess {
  final List<Video> videos;

  FetchSermonPlaylistSuccess(this.videos);
}
