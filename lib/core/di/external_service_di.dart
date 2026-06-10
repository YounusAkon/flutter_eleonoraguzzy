import 'package:flutter_eleonoraguzzy/core/constants/api_endpoints.dart';
import 'package:get/get.dart';
import 'package:flutter_eleonoraguzzy/core/services/app_pigeon/app_pigeon.dart';
import '../services/app_pigeon/refresh_token_manager.dart';

void externalServiceDI() {
  Get.put(
    AppPigeon(
      RefreshTokenManager(ApiEndpoints.refreshToken),
      baseUrl: ApiEndpoints.baseUrl,
    ),
  );
}
