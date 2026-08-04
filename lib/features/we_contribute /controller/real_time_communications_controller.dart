import 'package:get/get.dart';
import '../model/real_time_communications_model.dart';
import '../service/contribute_interface.dart';
import 'package:flutter_eleonoraguzzy/core/helpers/date_window.dart';

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
        communications.value = (success.data ?? [])
            .where((communication) => DateWindow.includes(communication.date))
            .toList();
        isLoading.value = false;
      },
    );
  }
}
