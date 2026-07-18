// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';

// import 'package:flutter_eleonoraguzzy/features/information/controller/informetion_local_&_national_controller.dart';
// import 'package:flutter_eleonoraguzzy/features/information/model/local_&_national_news_model.dart';
// import 'package:flutter_eleonoraguzzy/features/information/presentation/screens/news_detail_screen.dart';
// import 'package:flutter_eleonoraguzzy/features/information/service/information_interface.dart';

// class LocalAndNationalNewsWidget extends StatelessWidget {
//   LocalAndNationalNewsWidget({super.key});

//   final NewsController controller = Get.put(
//     NewsController(Get.find<InformationInterface>()),
//   );

//   // ================= DATE FORMATTER =================
//   String _formatDate(String? isoDate) {
//     if (isoDate == null || isoDate.isEmpty) return '';
//     try {
//       final date = DateTime.parse(isoDate).toLocal();
//       return DateFormat('MMMM d, yyyy').format(date);
//     } catch (_) {
//       return '';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final colorScheme = theme.colorScheme;

//     return Obx(() {
//       if (controller.isLoading.value) {
//         return const Center(child: CircularProgressIndicator());
//       }

//       if (controller.newsList.isEmpty) {
//         return const Center(
//           child: Text(
//             'No news available',
//             style: TextStyle(fontSize: 16),
//           ),
//         );
//       }

//       return SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//             width: double.infinity,
//             padding: const EdgeInsets.all(12),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(20),
//               border: Border.all(color: Colors.black26),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // ================= HEADER =================
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Icon(Icons.article, color: colorScheme.primary),
//                     const SizedBox(width: 8),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Local and National News',
//                             style: theme.textTheme.titleMedium?.copyWith(
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             'Stay up to date on the latest news affecting your community and the country.',
//                             style: theme.textTheme.bodyMedium,
//                             maxLines: 3,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),

//                 const SizedBox(height: 16),
//                 _noteCard(),
//                 const SizedBox(height: 24),

//                 // ================= NEWS LIST =================
//                 ...controller.newsList.map(
//                   (news) => Padding(
//                     padding: const EdgeInsets.only(bottom: 16),
//                     child: _newsItem(context, news),
//                   ),
//                 ),

//                 const SizedBox(height: 16),

//                 // ================= BUTTON =================
//                 SizedBox(
//                   width: double.infinity,
//                   height: 48,
//                   child: OutlinedButton.icon(
//                     onPressed: () {},
//                     icon: const Icon(Icons.menu_book, color: Colors.blue),
//                     label: const Text(
//                       'Read All the News',
//                       style: TextStyle(
//                         color: Colors.blue,
//                         fontWeight: FontWeight.w500,
//                         fontSize: 15,
//                       ),
//                     ),
//                     style: OutlinedButton.styleFrom(
//                       side: const BorderSide(color: Colors.blue, width: 1.5),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     });
//   }

//   // ================= NOTE CARD =================
//   Widget _noteCard() {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: const Color(0xFFE5EEFF),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: RichText(
//         text: const TextSpan(
//           children: [
//             TextSpan(
//               text: 'Note: ',
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 16,
//                 color: Color(0xFF3377FF),
//               ),
//             ),
//             TextSpan(
//               text:
//                   'We collaborate with several publications to offer you a complete overview.',
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Color(0xFF3377FF),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // ================= NEWS ITEM =================
//   Widget _newsItem(BuildContext context, LocalAndNationalNewsModel news) {
//     final theme = Theme.of(context);

//     return InkWell(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (_) => const NewsDetailsScreen(),
//           ),
//         );
//       },
//       child: Container(
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(12),
//           boxShadow: const [
//             BoxShadow(
//               color: Colors.black26,
//               blurRadius: 6,
//               offset: Offset(0, 3),
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Title + Category
//             Row(
//               children: [
//                 Expanded(
//                   child: Text(
//                     news.title ?? '',
//                     style: theme.textTheme.titleMedium?.copyWith(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 Text(
//                   news.category ?? '',
//                   style: theme.textTheme.bodySmall?.copyWith(
//                     fontWeight: FontWeight.w600,
//                     color: Colors.blue,
//                   ),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 8),

//             Text(
//               news.description ?? '',
//               maxLines: 3,
//               overflow: TextOverflow.ellipsis,
//             ),

//             const SizedBox(height: 12),

//             // Category + Date
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   news.category ?? '',
//                   style: theme.textTheme.bodySmall?.copyWith(
//                     fontWeight: FontWeight.w600,
//                     color: Colors.blue,
//                   ),
//                 ),
//                 Text(
//                   _formatDate(news.publishDate),
//                   style: theme.textTheme.bodySmall,
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_eleonoraguzzy/core/theme/app_sizes.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:flutter_eleonoraguzzy/features/information/controller/informetion_local_&_national_controller.dart';
import 'package:flutter_eleonoraguzzy/features/information/model/local_&_national_news_model.dart';
import 'package:flutter_eleonoraguzzy/features/information/presentation/screens/news_detail_screen.dart';
import 'package:flutter_eleonoraguzzy/features/information/service/information_interface.dart';

class LocalAndNationalNewsWidget extends StatelessWidget {
  LocalAndNationalNewsWidget({super.key});

  final NewsController controller = Get.put(
    NewsController(Get.find<InformationInterface>()),
  );

  // ================= DATE FORMATTER =================
  String _formatDate(String? isoDate) {
    if (isoDate == null || isoDate.isEmpty) return '';
    try {
      final date = DateTime.parse(isoDate).toLocal();
      return DateFormat('MMMM d, yyyy').format(date);
    } catch (_) {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      // ================= FILTER ONLY LOCAL & NATIONAL =================
      final filteredNews = controller.newsList
          .where(
            (news) =>
                news.category != null &&
                (news.category!.toLowerCase() == 'local' ||
                    news.category!.toLowerCase() == 'national'),
          )
          .toList();

      if (filteredNews.isEmpty) {
        return const Center(
          child: Text(
            'No local or national news available',
            style: TextStyle(fontSize: 16),
          ),
        );
      }

      return SingleChildScrollView(
        child: Padding(
          padding: AppSizes.screenPadding,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black26),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ================= HEADER =================
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.article, color: colorScheme.primary),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Local and National News',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Stay up to date on the latest news affecting your community and the country.',
                            style: theme.textTheme.bodyMedium,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),
                _noteCard(),
                const SizedBox(height: 24),

                // ================= NEWS LIST =================
                ...filteredNews.map(
                  (news) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: _newsItem(context, news),
                  ),
                ),

                const SizedBox(height: 16),

                // ================= BUTTON =================
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.menu_book, color: Colors.blue),
                    label: const Text(
                      'Read All the News',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.blue, width: 1.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  // ================= NOTE CARD =================
  Widget _noteCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE5EEFF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Text(
        'Note: We collaborate with several publications to offer you a complete overview.',
        style: TextStyle(fontSize: 16, color: Color(0xFF3377FF)),
      ),
    );
  }

  // ================= NEWS ITEM =================
  Widget _newsItem(BuildContext context, LocalAndNationalNewsModel news) {
    final theme = Theme.of(context);

    return InkWell(
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
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title + Category
            Row(
              children: [
                Expanded(
                  child: Text(
                    news.title ?? '',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      news.category ?? '',
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            Text(
              news.description ?? '',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),

            const SizedBox(height: 12),

            // Category + Date
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  news.category ?? '',
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.blue,
                  ),
                ),
                Text(
                  _formatDate(news.publishDate),
                  style: theme.textTheme.bodySmall?.copyWith(fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
