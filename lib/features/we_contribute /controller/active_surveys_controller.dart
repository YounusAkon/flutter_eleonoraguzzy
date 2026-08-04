import 'package:flutter_eleonoraguzzy/features/we_contribute%20/model/active_surveys_model.dart';
import 'package:flutter_eleonoraguzzy/features/we_contribute%20/service/contribute_interface.dart';
import 'package:get/get.dart';
import 'package:flutter_eleonoraguzzy/core/helpers/date_window.dart';

class ActiveSurveysController extends GetxController {
  final ContributeInterface repo;

  ActiveSurveysController(this.repo);

  var surveys = <ActiveSurveysModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadSurveys();
  }

  Future<void> loadSurveys() async {
    try {
      isLoading.value = true;

      final result = await repo.getAllSurveys();

      result.fold(
        (failure) {
          Get.log("Tender error: ${failure.uiMessage}");
        },
        (success) {
          final model = success.data;
          surveys.assignAll(
            (model ?? [])
                .where((survey) => DateWindow.includes(survey.date))
                .toList(),
          );
        },
      );
    } catch (e) {
      Get.log("Tender exception: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
