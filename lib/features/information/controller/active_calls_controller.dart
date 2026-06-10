import 'package:flutter_eleonoraguzzy/features/information/model/active_calls_model.dart';
import 'package:get/get.dart';
import 'package:flutter_eleonoraguzzy/features/information/service/information_interface.dart';

class ActivecallsController extends GetxController {
  final InformationInterface repo;

  ActivecallsController(this.repo);

  var activeCallsList = <ActiveCallsModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadActiveCalls();
  }

  Future<void> loadActiveCalls() async {
    isLoading.value = true;

    final result = await repo.getAllActiveCalls();

    result.fold(
      (failure) {
        Get.log('A: ${failure.uiMessage}');
        activeCallsList.clear();
      },
      (success) {
        activeCallsList.assignAll(success.data ?? []);
      },
    );

    isLoading.value = false;
  }
}
