import 'package:flutter_eleonoraguzzy/core/api_handler/base_repository.dart';
import 'package:flutter_eleonoraguzzy/core/helpers/typedefs.dart';
import 'package:flutter_eleonoraguzzy/features/public_matter/model/citizen_proposal_model.dart';

abstract base class PublicMatterInterface extends BaseRepository {
  FutureRequest<PublicMatterModel> publicMatter(
    PublicMatterRequestModel params,
  );
}
