import 'package:get/get.dart';
import '../model/electoral_programs_model.dart';
import '../service/contribute_interface.dart';

class ElectoralProgressController extends GetxController {
  ElectoralProgressController(this.repository);

  final ContributeInterface repository;

  final isLoading = true.obs;
  final progressData = <ElectoralProgressModel>[].obs;

  @override
  void onInit() {
    fetchElectoralProgress();
    super.onInit();
  }

  Future<void> fetchElectoralProgress() async {
    isLoading.value = true;

    final result = await repository.getAllElectoralProgress();

    result.fold(
      (error) {
        isLoading.value = false;
      },
      (success) {
        progressData.value = success.data ?? [];
        isLoading.value = false;
      },
    );
  }
}
