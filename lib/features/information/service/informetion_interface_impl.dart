import 'package:flutter_eleonoraguzzy/core/services/app_pigeon/app_pigeon.dart';
import 'package:flutter_eleonoraguzzy/core/api_handler/success.dart';
import 'package:flutter_eleonoraguzzy/core/constants/api_endpoints.dart';
import 'package:flutter_eleonoraguzzy/core/helpers/typedefs.dart';
import 'package:flutter_eleonoraguzzy/features/information/model/active_calls_model.dart';
import 'package:flutter_eleonoraguzzy/features/information/model/event_shows_model.dart';
import 'package:flutter_eleonoraguzzy/features/information/model/local_&_national_news_model.dart';
import 'package:flutter_eleonoraguzzy/features/information/service/information_interface.dart';

final class InformationInterfaceImpl extends InformationInterface {
  InformationInterfaceImpl(this.appPigeon);
  final AppPigeon appPigeon;

  @override
  FutureRequest<Success<List<LocalAndNationalNewsModel>>> getAllNews() async {
    return await asyncTryCatch(
      tryFunc: () async {
        final response = await appPigeon.get(ApiEndpoints.getAllContent);

        final body = response.data;
        final List list = body['data'];

        final contents = list
            .map((e) => LocalAndNationalNewsModel.fromJson(e))
            .toList();

        return Success(message: body['message'] ?? 'Success', data: contents);
      },
    );
  }

  @override
  FutureRequest<Success<List<EventShowsModel>>> getAllEventShows() async {
    return await asyncTryCatch(
      tryFunc: () async {
        final response = await appPigeon.get(ApiEndpoints.getAllEventShows);

        final body = response.data;
        final List list = body['data'];

        final contents = list.map((e) => EventShowsModel.fromJson(e)).toList();

        return Success(message: body['message'] ?? 'Success', data: contents);
      },
    );
  }

  @override
  FutureRequest<Success<List<ActiveCallsModel>>> getAllActiveCalls() async {
    return await asyncTryCatch(
      tryFunc: () async {
        final response = await appPigeon.get(ApiEndpoints.getAllActiveCalls);

        final body = response.data;
        final List list = body['data'];

        final contents = list.map((e) => ActiveCallsModel.fromJson(e)).toList();

        return Success(message: body['message'] ?? 'Success', data: contents);
      },
    );
  }
}
