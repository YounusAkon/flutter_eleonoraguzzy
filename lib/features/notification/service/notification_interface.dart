import 'package:flutter_eleonoraguzzy/core/api_handler/base_repository.dart';
import 'package:flutter_eleonoraguzzy/core/api_handler/success.dart';
import 'package:flutter_eleonoraguzzy/core/helpers/typedefs.dart';
import 'package:flutter_eleonoraguzzy/features/notification/model/notification_model.dart';

abstract base class NotificationInterface extends BaseRepository {
  FutureRequest<Success<List<NotificationModel>>> getAllNotification();

  FutureRequest<Success> singleNotificationRead(String id);

  FutureRequest<Success> allNotificationRead();
}
