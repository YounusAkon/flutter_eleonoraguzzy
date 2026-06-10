import 'package:flutter_eleonoraguzzy/core/services/app_pigeon/app_pigeon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eleonoraguzzy/core/api_handler/success.dart';
import 'package:flutter_eleonoraguzzy/core/constants/api_endpoints.dart';
import 'package:flutter_eleonoraguzzy/core/helpers/typedefs.dart';
import 'package:flutter_eleonoraguzzy/features/auth/model/change_password.dart';
import 'package:flutter_eleonoraguzzy/features/auth/model/create_new_password_model.dart';
import 'package:flutter_eleonoraguzzy/features/auth/model/forget_password_model.dart';
import 'package:flutter_eleonoraguzzy/features/auth/model/login_model.dart';
import 'package:flutter_eleonoraguzzy/features/auth/model/signup_model.dart';
import 'package:flutter_eleonoraguzzy/features/auth/model/verify_account_param.dart';
import 'package:flutter_eleonoraguzzy/features/auth/model/verify_otp_param.dart';
import 'package:flutter_eleonoraguzzy/features/auth/services/auth_interface.dart';

final class AuthInterfaceImpl extends AuthInterface {
  final AppPigeon appPigeon;

  AuthInterfaceImpl(this.appPigeon);

  @override
  FutureRequest<Success> login(LoginModel params) async {
    return await asyncTryCatch(
      tryFunc: () async {
        final response = await appPigeon.post(
          ApiEndpoints.login,
          data: params.toJson(),
        );

        debugPrint('LOGIN RESPONSE => ${response.data}');

        final loginResponse = LoginResponseModel.fromMap(response.data);

        await appPigeon.saveNewAuth(
          saveAuthParams: SaveNewAuthParams(
            uid: loginResponse.data!.user.id,
            accessToken: loginResponse.data!.accessToken,
            refreshToken: loginResponse.data!.refreshToken,
            data: {
              'name': loginResponse.data!.user.name,
              'email': loginResponse.data!.user.email,
              'role': loginResponse.data!.user.role,
            },
          ),
        );
        return Success(message: loginResponse.message);
      },
    );
  }

  @override
  FutureRequest<Success> signup(SignupModel params) async {
    return await asyncTryCatch(
      tryFunc: () async {
        final response = await appPigeon.post(
          ApiEndpoints.signup,
          data: params.toMap(),
        );
        debugPrint('SIGNUP RESPONSE => ${response.data}');
        final body = response.data;
        return Success(message: body["message"]);
      },
    );
  }

  @override
  FutureRequest<Success> forgetpassword(ForgetPasswordModel email) async {
    return await asyncTryCatch(
      tryFunc: () async {
        final response = await appPigeon.post(
          ApiEndpoints.forgetPassword,
          data: email.toJson(),
        );
        debugPrint('FORGET PASSWORD RESPONSE => ${response.data}');
        return Success(message: extractSuccessMessage(response));
      },
    );
  }

  @override
  FutureRequest<Success> verifyCode(VerifyOtpParam param) async {
    return await asyncTryCatch(
      tryFunc: () async {
        final response = await appPigeon.post(
          ApiEndpoints.verifyCode,
          data: param.toJson(),
        );
        debugPrint('VERIFY OTP RESPONSE => ${response.data}');
        return Success(message: extractSuccessMessage(response));
      },
    );
  }

  @override
  FutureRequest<Success> createNewPassword(CreatePasswordModel params) async {
    return await asyncTryCatch(
      tryFunc: () async {
        debugPrint("createNewPassword: ${params.toJson()}");
        final response = await appPigeon.post(
          ApiEndpoints.createNewPassword,
          data: params.toJson(),
        );
        debugPrint('CREATE NEW PASSWORD RESPONSE => ${response.data}');
        return Success(message: extractSuccessMessage(response));
      },
    );
  }

  @override
  FutureRequest<Success> verifyAccount(VerifyAccountParam params) {
    throw UnimplementedError();
  }

  @override
  FutureRequest<Success> logout() async {
    return await asyncTryCatch(
      tryFunc: () async {
        final response = await appPigeon.post(ApiEndpoints.logout);
        debugPrint('LOGOUT RESPONSE => ${response.data}');
        await appPigeon.logOut();
        return Success(message: extractSuccessMessage(response));
      },
    );
  }

  @override
  FutureRequest<Success> changePassword(ChangePasswordModel params) async {
    return await asyncTryCatch(
      tryFunc: () async {
        final response = await appPigeon.post(
          ApiEndpoints.changePassword,
          data: params.toJson(),
        );
        debugPrint('CHANGE PASSWORD RESPONSE => ${response.data}');
        return Success(message: extractSuccessMessage(response));
      },
    );
  }
}
