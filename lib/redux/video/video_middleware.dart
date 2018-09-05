import 'package:buddish_project/data/repository/youtube_repository.dart';
import 'package:buddish_project/redux/app/app_state.dart';
import 'package:buddish_project/redux/ui/sermon_videos_screen/sermon_video_screen_action.dart';
import 'package:buddish_project/redux/video/video_action.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createVideoMiddleware(
  YoutubeRepository youtubeRepository,
) {
  return [
    TypedMiddleware<AppState, FetchSermonPlaylist>(
      _fetchSermonPlaylist(youtubeRepository),
    ),
  ];
}

Middleware<AppState> _fetchSermonPlaylist(
  YoutubeRepository youtubeRepository,
) {
  return (Store store, action, NextDispatcher next) async {
    if (action is FetchSermonPlaylist) {
      try {
        next(ShowSermonLoading());
        var videos = await youtubeRepository.fetchVideosFromPlaylist(action.playlistId);
        next(FetchSermonPlaylistSuccess(videos));
        next(HideSermonLoading());
      } catch (error) {
        print(error);
        next(HideSermonLoading());
      }

      next(action);
    }
  };
}
