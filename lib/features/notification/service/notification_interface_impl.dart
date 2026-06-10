import 'package:flutter_eleonoraguzzy/core/services/app_pigeon/app_pigeon.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_eleonoraguzzy/core/api_handler/success.dart';
import 'package:flutter_eleonoraguzzy/core/constants/api_endpoints.dart';
import 'package:flutter_eleonoraguzzy/core/helpers/typedefs.dart';
import 'package:flutter_eleonoraguzzy/features/notification/service/notification_interface.dart';
import 'package:flutter_eleonoraguzzy/features/notification/model/notification_model.dart';

final class NotificationInterfaceImpl extends NotificationInterface {
  final AppPigeon appPigeon;

  NotificationInterfaceImpl({required this.appPigeon});

  @override
  FutureRequest<Success> singleNotificationRead(String id) async {
    return await asyncTryCatch(
      tryFunc: () async {
        //api call
        final response = await appPigeon.put(
          ApiEndpoints.markNotificationAsRead(notificationId: id),
        );

        //patse
        final message = response.data["message"] as String;

        //return
        return Success(message: message);
      },
    );
  }

  @override
  FutureRequest<Success> allNotificationRead() async {
    return await asyncTryCatch(
      tryFunc: () async {
        //api call
        final response = await appPigeon.put(ApiEndpoints.readAllNotifications);
        //patse
        final message = response.data["message"] as String;
        //return
        return Success(message: message);
      },
    );
  }

  @override
FutureRequest<Success<List<NotificationModel>>> getAllNotification() async {
  return await asyncTryCatch(
    tryFunc: () async {
      final response = await appPigeon.get(ApiEndpoints.getAllNotifications);

      debugPrint(response.data.toString());

      // ✅ FIX: extract docs array
      final List<dynamic> docs =
          response.data["data"]["docs"] as List<dynamic>;

      final notifications =
          docs.map((e) => NotificationModel.fromJson(e)).toList();

      return Success(
        message: extractSuccessMessage(response),
        data: notifications,
      );
    },
  );
}

}
