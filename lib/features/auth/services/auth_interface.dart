import 'package:flutter_eleonoraguzzy/core/api_handler/base_repository.dart';
import 'package:flutter_eleonoraguzzy/core/api_handler/success.dart';
import 'package:flutter_eleonoraguzzy/core/helpers/typedefs.dart';
import 'package:flutter_eleonoraguzzy/features/auth/model/change_password.dart';
import 'package:flutter_eleonoraguzzy/features/auth/model/create_new_password_model.dart';
import 'package:flutter_eleonoraguzzy/features/auth/model/forget_password_model.dart';
import 'package:flutter_eleonoraguzzy/features/auth/model/login_model.dart';
import 'package:flutter_eleonoraguzzy/features/auth/model/signup_model.dart';
import 'package:flutter_eleonoraguzzy/features/auth/model/verify_account_param.dart';
import 'package:flutter_eleonoraguzzy/features/auth/model/verify_otp_param.dart';

 abstract base class AuthInterface extends BaseRepository{
  FutureRequest<Success> login(LoginModel params);

  FutureRequest<Success> logout();

  FutureRequest<Success> signup(SignupModel params);

  FutureRequest<Success> verifyAccount(VerifyAccountParam params);

  FutureRequest<Success> forgetpassword(ForgetPasswordModel email);

  FutureRequest<Success> verifyCode(VerifyOtpParam param);

  FutureRequest<Success> createNewPassword(CreatePasswordModel params);

  FutureRequest<Success> changePassword(ChangePasswordModel params);
  
}
