import 'package:flutter_eleonoraguzzy/core/api_handler/base_repository.dart';
import 'package:flutter_eleonoraguzzy/core/api_handler/success.dart';
import 'package:flutter_eleonoraguzzy/core/helpers/typedefs.dart';
import 'package:flutter_eleonoraguzzy/features/tender/model/tender_model.dart';

abstract base class TenderInterface extends BaseRepository {
  FutureRequest<Success<TenderModel>> getAllTender(String id);
}