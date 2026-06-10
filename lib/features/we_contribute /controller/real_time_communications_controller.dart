import 'package:get/get.dart';
import '../model/real_time_communications_model.dart';
import '../service/contribute_interface.dart';

class RealTimeCommunicationsController extends GetxController {
  final ContributeInterface repo;

  RealTimeCommunicationsController(this.repo);

  final isLoading = true.obs;
  final communications = <RealTimeCommunicationsModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCommunications();
  }

  Future<void> fetchCommunications() async {
    isLoading.value = true;

    final result = await repo.getAllRealTimeContribute();

    result.fold(
      (error) {
        isLoading.value = false;
      },
      (success) {
        communications.value = success.data ?? [];
        isLoading.value = false;
      },
    );
  }
}
