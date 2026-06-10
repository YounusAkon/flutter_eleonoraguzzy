import 'package:flutter_eleonoraguzzy/core/api_handler/success.dart';
import 'package:flutter_eleonoraguzzy/core/constants/api_endpoints.dart';
import 'package:flutter_eleonoraguzzy/core/helpers/typedefs.dart';
import 'package:flutter_eleonoraguzzy/core/services/app_pigeon/app_pigeon.dart';
import 'package:flutter_eleonoraguzzy/features/tender/model/tender_model.dart';
import 'package:flutter_eleonoraguzzy/features/tender/service/tender_interface.dart';

final class TenderInterfaceImpl extends TenderInterface {
  TenderInterfaceImpl(this.appPigeon);
  final AppPigeon appPigeon;

  @override
  FutureRequest<Success<TenderModel>> getAllTender(String id) async {
    return await asyncTryCatch(
      tryFunc: () async {
        final response = await appPigeon.get(ApiEndpoints.getAllTenders);

        final body = response.data;

        final tender = TenderModel.fromJson(body);

        return Success(message: body['message'] ?? 'Success', data: tender);
      },
    );
  }
}
