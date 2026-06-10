import 'package:flutter_eleonoraguzzy/core/api_handler/base_repository.dart';
import 'package:flutter_eleonoraguzzy/core/api_handler/success.dart';
import 'package:flutter_eleonoraguzzy/core/helpers/typedefs.dart';
import 'package:flutter_eleonoraguzzy/features/we_contribute%20/model/active_surveys_model.dart';
import 'package:flutter_eleonoraguzzy/features/we_contribute%20/model/real_time_communications_model.dart';
import 'package:flutter_eleonoraguzzy/features/we_contribute%20/model/take_surveys_model.dart';
import 'package:flutter_eleonoraguzzy/features/we_contribute%20/model/virtuous_award_model.dart';

import '../model/electoral_programs_model.dart';

abstract base class ContributeInterface extends BaseRepository {
  FutureRequest<Success<List<ActiveSurveysModel>>> getAllSurveys();
  FutureRequest<Success<List<ElectoralProgressModel>>>
  getAllElectoralProgress();
  FutureRequest<Success<List<RealTimeCommunicationsModel>>>
  getAllRealTimeContribute();
  FutureRequest<Success<List<VirtuousAwardModel>>>
  getAllVirtuousAdministration();
  FutureRequest<Success> takeSurveys({required TakeSurveyRequestModel request});
}
