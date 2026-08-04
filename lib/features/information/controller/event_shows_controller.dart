import 'package:flutter_eleonoraguzzy/features/information/model/event_shows_model.dart';
import 'package:get/get.dart';
import 'package:flutter_eleonoraguzzy/features/information/service/information_interface.dart';
import 'package:flutter_eleonoraguzzy/core/helpers/date_window.dart';

class EventShowsController extends GetxController {
  final InformationInterface repo;

  EventShowsController(this.repo);

  var eventShowsList = <EventShowsModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadNews();
  }

  Future<void> loadNews() async {
    isLoading.value = true;

    final result = await repo.getAllEventShows();

    result.fold(
      (failure) {
        Get.log('Event Shows error: ${failure.uiMessage}');
        eventShowsList.clear();
      },
      (success) {
        eventShowsList.assignAll(
          (success.data ?? [])
              .where(
                (event) =>
                    DateWindow.includesRange(event.startdate, event.enddate),
              )
              .toList(),
        );
      },
    );

    isLoading.value = false;
  }
}
