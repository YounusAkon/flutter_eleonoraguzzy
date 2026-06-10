import 'package:flutter/material.dart';
import 'package:flutter_eleonoraguzzy/core/constants/api_endpoints.dart';
import 'package:flutter_eleonoraguzzy/core/helpers/typedefs.dart';
import 'package:flutter_eleonoraguzzy/core/services/app_pigeon/app_pigeon.dart';
import 'package:flutter_eleonoraguzzy/features/public_matter/model/citizen_proposal_model.dart';
import 'package:flutter_eleonoraguzzy/features/public_matter/service/public_matter_interface.dart';

final class PublicMatterInterfaceImpl extends PublicMatterInterface {
  final AppPigeon appPigeon;

  PublicMatterInterfaceImpl(this.appPigeon);

  @override
  FutureRequest<PublicMatterModel> publicMatter(
    PublicMatterRequestModel params,
  ) async {
    return await asyncTryCatch(
      tryFunc: () async {
        final response = await appPigeon.post(
          ApiEndpoints.publicMatter,
          data: params.toJson(),
        );

        debugPrint('PUBLIC MATTER RESPONSE => ${response.data}');

        final body = response.data;
        final data = body['data'];

        return PublicMatterModel.fromJson(data);
      },
    );
  }
}
