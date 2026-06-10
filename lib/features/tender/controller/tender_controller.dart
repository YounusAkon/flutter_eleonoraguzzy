import 'package:flutter_eleonoraguzzy/features/tender/service/tender_interface.dart';
import 'package:get/get.dart';
import 'package:flutter_eleonoraguzzy/features/tender/model/tender_model.dart';

class TenderController extends GetxController {
  TenderController(this._tenderInterface);

  final TenderInterface _tenderInterface;

  final isLoading = false.obs;
  final tenders = <Data>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchTenders();
  }

  Future<void> fetchTenders() async {
    try {
      isLoading.value = true;

      final result = await _tenderInterface.getAllTender("any_id");

      result.fold(
        (failure) {
          Get.log("Tender error: ${failure.uiMessage}");
        },
        (success) {
          final model = success.data;
          tenders.assignAll(model?.data ?? []);
        },
      );
    } catch (e) {
      Get.log("Tender exception: $e");
    } finally {
      isLoading.value = false;
    }
  }
}

