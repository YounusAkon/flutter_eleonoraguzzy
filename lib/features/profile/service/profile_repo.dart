import 'package:flutter_eleonoraguzzy/core/api_handler/base_repository.dart';
import 'package:flutter_eleonoraguzzy/core/api_handler/success.dart';
import 'package:flutter_eleonoraguzzy/core/helpers/typedefs.dart';
import 'package:flutter_eleonoraguzzy/features/profile/model/delete_account_model.dart';
import 'package:flutter_eleonoraguzzy/features/profile/model/edit_profile_model.dart';
import 'package:flutter_eleonoraguzzy/features/profile/model/get_profile_model.dart';

abstract base class ProfilInterface extends BaseRepository {
  FutureRequest<Success<ProfileModel>> getProfile(String id);
  FutureRequest<Success<DeleteAccountModel>> deleteAccount();
  FutureRequest<Success<ProfileModel>> updateProfile(EditProfileModel param);
}
