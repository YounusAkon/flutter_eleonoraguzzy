import 'package:flutter_eleonoraguzzy/core/api_handler/success.dart';
import 'package:flutter_eleonoraguzzy/core/constants/api_endpoints.dart';
import 'package:flutter_eleonoraguzzy/core/helpers/typedefs.dart';
import 'package:flutter_eleonoraguzzy/core/services/app_pigeon/app_pigeon.dart';
import 'package:flutter_eleonoraguzzy/features/we_contribute%20/model/active_surveys_model.dart';
import 'package:flutter_eleonoraguzzy/features/we_contribute%20/model/electoral_programs_model.dart';
import 'package:flutter_eleonoraguzzy/features/we_contribute%20/model/real_time_communications_model.dart';
import 'package:flutter_eleonoraguzzy/features/we_contribute%20/model/take_surveys_model.dart';
import 'package:flutter_eleonoraguzzy/features/we_contribute%20/model/virtuous_award_model.dart';
import 'package:flutter_eleonoraguzzy/features/we_contribute%20/service/contribute_interface.dart';

final class ContributeInterfaceImpl extends ContributeInterface {
  ContributeInterfaceImpl(this.appPigeon);
  final AppPigeon appPigeon;

  @override
  FutureRequest<Success<List<ActiveSurveysModel>>> getAllSurveys() async {
    return await asyncTryCatch(
      tryFunc: () async {
        final response = await appPigeon.get(ApiEndpoints.getAllSurvay);

        final body = response.data;
        final List list = body['data'];

        final surveys = list
            .map((e) => ActiveSurveysModel.fromJson(e))
            .toList();

        return Success(message: body['message'] ?? 'Success', data: surveys);
      },
    );
  }

  @override
  FutureRequest<Success<List<ElectoralProgressModel>>>
  getAllElectoralProgress() async {
    return await asyncTryCatch(
      tryFunc: () async {
        final response = await appPigeon.get(
          ApiEndpoints.getAllElectoralProgress,
        );

        final body = response.data;
        final List list = body['data'];

        final data = list
            .map((e) => ElectoralProgressModel.fromJson(e))
            .toList();

        return Success(message: body['message'] ?? 'Success', data: data);
      },
    );
  }

  @override
  FutureRequest<Success<List<RealTimeCommunicationsModel>>>
  getAllRealTimeContribute() async {
    return await asyncTryCatch(
      tryFunc: () async {
        final response = await appPigeon.get(
          ApiEndpoints.getAllRealTimeContribute,
        );

        final body = response.data;
        final List list = body['data'];

        final realTimeContribute = list
            .map((e) => RealTimeCommunicationsModel.fromJson(e))
            .toList();

        return Success(
          message: body['message'] ?? 'Success',
          data: realTimeContribute,
        );
      },
    );
  }

  @override
  FutureRequest<Success<List<VirtuousAwardModel>>>
  getAllVirtuousAdministration() async {
    return await asyncTryCatch(
      tryFunc: () async {
        final response = await appPigeon.get(
          ApiEndpoints.getAllVirtuousAdministration,
        );

        final body = response.data;
        final List list = body['data'];

        final virtuousAdministration = list
            .map((e) => VirtuousAwardModel.fromJson(e))
            .toList();

        return Success(
          message: body['message'] ?? 'Success',
          data: virtuousAdministration,
        );
      },
    );
  }

  @override
  FutureRequest<Success> takeSurveys({
    required TakeSurveyRequestModel request,
  }) async {
    return await asyncTryCatch(
      tryFunc: () async {
        final response = await appPigeon.post(
          ApiEndpoints.takeSurveys,
          data: request.toFormData(),
        );

        return Success(message: extractSuccessMessage(response));
      },
    );
  }
}
