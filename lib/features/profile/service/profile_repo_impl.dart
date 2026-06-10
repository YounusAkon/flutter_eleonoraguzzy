import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eleonoraguzzy/core/api_handler/success.dart';
import 'package:flutter_eleonoraguzzy/core/constants/api_endpoints.dart';
import 'package:flutter_eleonoraguzzy/core/helpers/typedefs.dart';
import 'package:flutter_eleonoraguzzy/core/services/app_pigeon/app_pigeon.dart';
import 'package:flutter_eleonoraguzzy/core/utils/helpers/format_response_data.dart';
import 'package:flutter_eleonoraguzzy/features/profile/model/delete_account_model.dart';
import 'package:flutter_eleonoraguzzy/features/profile/model/edit_profile_model.dart';
import 'package:flutter_eleonoraguzzy/features/profile/model/get_profile_model.dart';
import 'package:flutter_eleonoraguzzy/features/profile/service/profile_repo.dart';

final class ProfileInterfaceImpl extends ProfilInterface {
  ProfileInterfaceImpl({required this.appPigeon});
  final AppPigeon appPigeon;
  // @override
  // FutureRequest<Success<ProfileModel>> getProfile(String id) async {
  //   return await asyncTryCatch(
  //     tryFunc: () async {
  //       debugPrint("FETCHING PROFILE FOR USER ID: $id");

  //       final response = await appPigeon.get(ApiEndpoints.getuserbyId(id));

  //       debugPrint("RAW RESPONSE: ${response.data}");

  //       if (response.data == null || response.data["data"] == null) {
  //         throw Exception("No data in response");
  //       }

  //       final data = response.data["data"] as Map<String, dynamic>;
  //       debugPrint("PARSED DATA MAP: $data");

  //       final ProfileModel profileModel = ProfileModel.fromMap(data);
  //       final message = response.data["message"]?.toString() ?? "Success";
  //       debugPrint(
  //         "PROFILE MODEL CREATED: ${profileModel.name} (${profileModel.email})",
  //       );
  //       return Success(data: profileModel, message: message);
  //     },
  //   );
  // }
  @override
  FutureRequest<Success<ProfileModel>> getProfile(String id) async {
    return await asyncTryCatch(
      tryFunc: () async {
        debugPrint("FETCHING PROFILE FOR USER ID: $id");

        final response = await appPigeon.get(ApiEndpoints.getuserbyId(id));

        if (response.data == null || response.data is! Map) {
          throw Exception("Invalid response format from server");
        }

        final rootData = response.data as Map<String, dynamic>;

        if (rootData['success'] != true || rootData['data'] == null) {
          throw Exception(rootData['message'] ?? "Failed to fetch profile");
        }

        final profileMap = rootData['data'] as Map<String, dynamic>;

        final profileModel = ProfileModel.fromMap(profileMap);

        return Success(
          data: profileModel,
          message:
              rootData['message']?.toString() ?? "Profile fetched successfully",
        );
      },
    );
  }

  @override
  FutureRequest<Success<ProfileModel>> updateProfile(
    EditProfileModel param,
  ) async {
    return await asyncTryCatch(
      tryFunc: () async {
        final response = await appPigeon.patch(
          ApiEndpoints.updateUser,
          data: param.toFormData(), // ✅ JSON body
          options: Options(contentType: 'multipart/form-data'),
        );

        final updatedData = response.data["data"] as Map<String, dynamic>;
        final updatedProfile = ProfileModel.fromMap(updatedData);

        return Success(
          data: updatedProfile,
          message:
              extractSuccessMessage(response) ?? "Profile updated successfully",
        );
      },
    );
  }

  @override
  FutureRequest<Success<DeleteAccountModel>> deleteAccount() async {
    return await asyncTryCatch(
      tryFunc: () async {
        final response = await appPigeon.delete(
          ApiEndpoints.deleteAccount,
        );

        return Success(
          data: DeleteAccountModel(),
          message:
              extractSuccessMessage(response) ?? "Account deleted successfully",
        );
      },
    );
  }

  // @override
  // FutureRequest<Success<HelpSupportModel>> getHelpSupport(
  //   HelpSupportModel param,
  // ) async {
  //   return await asyncTryCatch(
  //     tryFunc: () async {
  //       final response = await appPigeon.post(
  //         ApiEndpoints.helpSupport,
  //         data: param.toJson(),
  //       );

  //       final data = response.data["data"] as Map<String, dynamic>;

  //       final model = HelpSupportModel(
  //         email: data["email"],
  //         heading: data["heading"],
  //         description: data["description"],
  //         appVersion: data["appVersion"],
  //         platform: data["platform"],
  //       );

  //       return Success(
  //         data: model,
  //         message:
  //             extractSuccessMessage(response) ??
  //             "Support ticket created successfully",
  //       );
  //     },
  //   );
  // }
}
