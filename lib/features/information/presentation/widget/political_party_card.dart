import 'package:flutter/material.dart';
import 'package:flutter_eleonoraguzzy/core/theme/app_sizes.dart';
import 'package:flutter_eleonoraguzzy/features/information/controller/informetion_local_&_national_controller.dart';
import 'package:flutter_eleonoraguzzy/features/information/model/local_&_national_news_model.dart';
import 'package:flutter_eleonoraguzzy/features/information/presentation/screens/news_detail_screen.dart';
import 'package:flutter_eleonoraguzzy/features/information/service/information_interface.dart';
import 'package:get/get.dart';

class PoliticalPartyWidget extends StatelessWidget {
  PoliticalPartyWidget({super.key});

  final NewsController controller = Get.put(
    NewsController(Get.find<InformationInterface>()),
  );

  // // ================= DATE FORMATTER =================
  // String _formatDate(String? isoDate) {
  //   if (isoDate == null || isoDate.isEmpty) return '';
  //   try {
  //     final date = DateTime.parse(isoDate).toLocal();
  //     return DateFormat('MMMM d, yyyy').format(date);
  //   } catch (_) {
  //     return '';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F6FF),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return SingleChildScrollView(
          padding: AppSizes.screenPadding,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.black26),
            ),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  _headerCard(),
                  const SizedBox(height: 16),

                  ...controller.newsList.map(
                    (news) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: _newsItem(context, news),
                    ),
                  ),

                  const SizedBox(height: 24),
                  _readAllButton(),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  // ================= HEADER =================
  Widget _headerCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.people_alt, color: Colors.blue, size: 20),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Political Party Cards',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            'Get to know political parties in depth: history, values, proposals and local/national representatives.',
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  // ================= READ ALL BUTTON =================
  Widget _readAllButton() {
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.menu_book, size: 20, color: Colors.blue),
        label: const Text(
          'Read All the News',
          style: TextStyle(color: Colors.blue, fontSize: 15),
        ),
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.blue, width: 1.5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }

  // ================= UPDATED CARD (MATCH IMAGE) =================
  Widget _newsItem(BuildContext context, LocalAndNationalNewsModel news) {
    // Only show political category
    if (news.category != 'Political') return const SizedBox.shrink();

    // Parse color from backend
    Color dotColor;
    try {
      dotColor = news.color != null && news.color!.isNotEmpty
          ? Color(int.parse(news.color!.replaceAll('#', '0xFF')))
          : Colors.blue; // default
    } catch (_) {
      dotColor = Colors.blue;
    }

    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => NewsDetailsScreen(news: news)),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// HEADER
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Colored Dot
                Container(
                  width: 14,
                  height: 14,
                  margin: const EdgeInsets.only(top: 4),
                  decoration: BoxDecoration(
                    color: dotColor,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 4),

                /// Title + Leader
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        news.title ?? '',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Leader: ${news.subTitle ?? 'N/A'}',
                        style: TextStyle(fontSize: 16),
                      ),

                      /// MAIN VALUES
                      if (news.mainValues.isNotEmpty) ...[
                        const Text(
                          'Main values:',
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 4,
                          runSpacing: 8,
                          children: news.mainValues.map((value) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: dotColor,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text(
                                value.heading ?? '',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],

                      const SizedBox(height: 12),

                      /// FOOTER
                      Text(
                        'Local representation: 1 municipal councilor',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
