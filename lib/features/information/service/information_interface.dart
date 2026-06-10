import 'package:flutter_eleonoraguzzy/core/api_handler/base_repository.dart';
import 'package:flutter_eleonoraguzzy/core/api_handler/success.dart';
import 'package:flutter_eleonoraguzzy/core/helpers/typedefs.dart';
import 'package:flutter_eleonoraguzzy/features/information/model/active_calls_model.dart';
import 'package:flutter_eleonoraguzzy/features/information/model/event_shows_model.dart';
import 'package:flutter_eleonoraguzzy/features/information/model/local_&_national_news_model.dart';

abstract base class InformationInterface extends BaseRepository {
  FutureRequest<Success<List<LocalAndNationalNewsModel>>> getAllNews();
  FutureRequest<Success<List<EventShowsModel>>> getAllEventShows();
  FutureRequest<Success<List<ActiveCallsModel>>> getAllActiveCalls();
}
