// import 'package:flutter/foundation.dart';
// import 'package:flutter_appauth/flutter_appauth.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:flutter_k_oppelt/core/api_handler/success.dart';
// import 'package:flutter_k_oppelt/core/constants/api_endpoints.dart';
// import 'package:flutter_k_oppelt/core/services/app_pigeon/app_pigeon.dart';
// import 'package:flutter_k_oppelt/core/utils/helpers/format_response_data.dart';
// import 'package:flutter_k_oppelt/feature/auth/model/login_entity.dart';

// class OAuthService {
//   OAuthService(this.appPigeon,);
//   //final ICacheService cacheService;
//   final AppPigeon appPigeon;
//   final FlutterAppAuth _appAuth = FlutterAppAuth();
//   final String backendBaseUrl = ApiEndpoints.baseUrl;
//   final String _googleClientId = const String.fromEnvironment('GOOGLE_CLIENT_ID', defaultValue: "GOOGLE_CLIENT_ID is not set");
//   final String _facebookClientId = const String.fromEnvironment('FACEBOOK_CLIENT_ID', defaultValue: "FACEBOOK_CLIENT_ID is not set");
//   final String _redirectUrl = const String.fromEnvironment('REDIRECT_URL');
  
//   /// Returns success message or throws error.
//   Future<Success> loginWithGoogle() async {
//     debugPrint("Login with google clientId : $_googleClientId, redirectUrl: $_redirectUrl");
//     final AuthorizationTokenResponse result = await _appAuth.authorizeAndExchangeCode(
//       AuthorizationTokenRequest(
//         _googleClientId,
//         _redirectUrl,
//         serviceConfiguration: AuthorizationServiceConfiguration(
//           authorizationEndpoint: 'https://accounts.google.com/o/oauth2/v2/auth',
//           tokenEndpoint: 'https://oauth2.googleapis.com/token',
//         ),
//         scopes: ['openid', 'profile', 'email'],
//       )
//     );

//     final idToken = result.idToken;
//     final accessToken = result.accessToken;
//     debugPrint("IdToken: $idToken, accessToken: $accessToken");
//     // Send idToken to backend for verification... and app JWt issuance..
//     final resp = await appPigeon.post(
//       ApiEndpoints.socialLogin,
//       data: LoginRequestParams.googleLogin(idToken: idToken ?? "").toJson(),);

//     /// parse accessToken and refressToken
//     final body = extractBodyData(resp);
//     debugPrint(body.toString());
//     await _extractAndSaveAuth(body);
//     //await cacheService.put<bool>(HiveCacheKeys.isFirstTimeLogin, false);
//     return Success(message: extractSuccessMessage(resp) ?? "Successfully logged in.");
//   }

//   Future<Success> loginWithFacebook() async {
//     final result = await FacebookAuth.instance.login(
//       permissions: ['email, public_profile'],
//     );

//     if (result.status == LoginStatus.success) {
//       final userData = await FacebookAuth.instance.getUserData();
//       final accessToken = result.accessToken;
//       if(accessToken == null) {
//         throw Exception("Something went wrong with facebook login!");
//       }
//       final resp = await appPigeon.post(
//         ApiEndpoints.socialLogin,
//         data: LoginRequestParams.facebookLogin(accessToken: accessToken.tokenString).toJson(),
//       );

//       final body = extractBodyData(resp);
//       await _extractAndSaveAuth(body);
//       //await cacheService.put<bool>(HiveCacheKeys.isFirstTimeLogin, false);
//       return Success(message: extractSuccessMessage(resp) ?? "Successfully logged in.");
//     } else {
//       throw Exception('Facebook login failed: ${result.status}');
//     }
//   }

//   Future<void> _extractAndSaveAuth(dynamic body) async{
//      await appPigeon.saveNewAuth(
//       saveAuthParams: SaveNewAuthParams(
//         uid: body["user"]["_id"] as String,
//         accessToken: body["accessToken"] as String,
//         refreshToken: body["user"]["refreshToken"] as String,
//         data: {
//           "userId": body["user"]["_id"] as String? ?? "",
//         }
//       )..toString(),
//     );
//   }
// }