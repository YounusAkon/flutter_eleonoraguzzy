import 'package:flutter_eleonoraguzzy/features/we_contribute%20/model/virtuous_award_model.dart';
import 'package:flutter_eleonoraguzzy/features/we_contribute%20/service/contribute_interface.dart';
import 'package:get/get.dart';

class VirtuousAwardController extends GetxController {
  final ContributeInterface repo;

  VirtuousAwardController(this.repo);

  var awards = <VirtuousAwardModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAwards();
  }

  Future<void> fetchAwards() async {
    try {
      isLoading.value = true;
      final result = await repo.getAllVirtuousAdministration();
      result.fold(
        (failure) {
          Get.log("Virtuous award error: ${failure.uiMessage}");
        },
        (success) {
          awards.assignAll(success.data ?? []);
        },
      );
    } catch (e) {
      Get.log("Virtuous award exception: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
