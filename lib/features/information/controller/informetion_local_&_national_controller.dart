import 'package:get/get.dart';
import 'package:flutter_eleonoraguzzy/features/information/model/local_&_national_news_model.dart';
import 'package:flutter_eleonoraguzzy/features/information/service/information_interface.dart';
import 'package:flutter_eleonoraguzzy/core/helpers/date_window.dart';

class NewsController extends GetxController {
  final InformationInterface repo;

  NewsController(this.repo);

  var newsList = <LocalAndNationalNewsModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadNews();
  }

  Future<void> loadNews() async {
    isLoading.value = true;

    final result = await repo.getAllNews();

    result.fold(
      (failure) {
        Get.log('News error: ${failure.uiMessage}');
        newsList.clear();
      },
      (success) {
        newsList.assignAll(
          (success.data ?? [])
              .where((news) => DateWindow.includes(news.publishDate))
              .toList(),
        );
      },
    );

    isLoading.value = false;
  }
}
