import 'package:buddish_project/redux/app/app_state.dart';
import 'package:buddish_project/redux/notification/notification_action.dart';
import 'package:buddish_project/service/notification_service.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createNotificationMiddleware(
  NotificationService notificationService,
) {
  return [
    TypedMiddleware<AppState, SubscribeTopic>(_subscribeTopic(notificationService)),
    TypedMiddleware<AppState, BroadcastTopic>(_broadcastTopic(notificationService)),
    TypedMiddleware<AppState, UnSubscribeTopic>(_unSubscribeTopic(notificationService)),
  ];
}

Middleware<AppState> _subscribeTopic(
  NotificationService notificationService,
) {
  return (Store store, action, NextDispatcher next) async {
    if (action is SubscribeTopic) {
      try {
        notificationService.initPushNotification(action.context, action.topic);
      } catch (error) {
        print(error);
      }

      next(action);
    }
  };
}

Middleware<AppState> _broadcastTopic(
  NotificationService notificationService,
) {
  return (Store store, action, NextDispatcher next) async {
    if (action is BroadcastTopic) {
      try {
        notificationService.sendNewsPushNotification(action.title, action.body);
      } catch (error) {
        print(error);
      }

      next(action);
    }
  };
}

Middleware<AppState> _unSubscribeTopic(
  NotificationService notificationService,
) {
  return (Store store, action, NextDispatcher next) async {
    if (action is UnSubscribeTopic) {
      try {
        notificationService.unsubscribeTopic(action.topic);
      } catch (error) {
        print(error);
      }

      next(action);
    }
  };
}
