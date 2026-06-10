// import 'package:flutter_eleonoraguzzy/core/services/app_pigeon/app_pigeon.dart';
// import 'package:dio/src/dio.dart';
// import 'package:flutter/rendering.dart';
// import '../constants/api_endpoints.dart';
// import '../utils/helpers/format_response_data.dart';

// class RefreshTokenManager implements RefreshTokenManagerInterface {
//   @override
//   String get url => ApiEndpoints.refreshToken;

//   @override
//   Future<RefreshTokenResponse> refreshToken({
//     required String refreshToken,
//     required Dio dio,
//   }) async {
//     final response = await dio.post(url, data: {"refreshToken": refreshToken});
//     debugPrint("Refresh token response: ${response.data}");
//     final data = extractBodyData(response);
//     return RefreshTokenResponse(
//       accessToken: data["accessToken"],
//       refreshToken: data["refreshToken"],
//       data: (data["userId"] != null) ? {"userId": data["userId"]} : null,
//     );
//   }
// }
