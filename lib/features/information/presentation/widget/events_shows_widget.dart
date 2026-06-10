// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:flutter_eleonoraguzzy/features/information/controller/event_shows_controller.dart';
// // import 'package:flutter_eleonoraguzzy/features/information/model/event_shows_model.dart';
// // import 'package:intl/intl.dart';

// // class EventsShowsWidget extends StatelessWidget {
// //   EventsShowsWidget({super.key});

// //   final EventShowsController controller = Get.put(
// //     EventShowsController(Get.find()),
// //   );

// //   @override
// //   Widget build(BuildContext context) {
// //     final theme = Theme.of(context);

// //     return Scaffold(
// //       backgroundColor: const Color(0xFFF2F6FF),
// //       body: Obx(() {
// //         if (controller.isLoading.value) {
// //           return const Center(child: CircularProgressIndicator());
// //         }

// //         if (controller.eventShowsList.isEmpty) {
// //           return const Center(
// //             child: Text('No events available', style: TextStyle(fontSize: 16)),
// //           );
// //         }

// //         return SingleChildScrollView(
// //           padding: const EdgeInsets.all(12),
// //           child: Container(
// //             width: double.infinity,
// //             padding: const EdgeInsets.all(16),
// //             decoration: BoxDecoration(
// //               color: Colors.white,
// //               borderRadius: BorderRadius.circular(20),
// //               border: Border.all(color: Colors.black26),
// //             ),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 _header(theme),
// //                 const SizedBox(height: 24),

// //                 ...controller.eventShowsList.map(
// //                   (event) => Padding(
// //                     padding: const EdgeInsets.only(bottom: 16),
// //                     child: _eventShowItem(context, event),
// //                   ),
// //                 ),

// //                 const SizedBox(height: 16),

// //                 SizedBox(
// //                   width: double.infinity,
// //                   height: 48,
// //                   child: OutlinedButton.icon(
// //                     onPressed: () {},
// //                     icon: const Icon(Icons.menu_book, color: Colors.blue),
// //                     label: const Text(
// //                       'Read All the News',
// //                       style: TextStyle(
// //                         color: Colors.blue,
// //                         fontWeight: FontWeight.w600,
// //                       ),
// //                     ),
// //                     style: OutlinedButton.styleFrom(
// //                       side: const BorderSide(color: Colors.blue, width: 1.5),
// //                       shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(10),
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         );
// //       }),
// //     );
// //   }

// //   // ================= HEADER =================

// //   Widget _header(ThemeData theme) {
// //     return Row(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         const Icon(Icons.calendar_today_outlined, color: Colors.green),
// //         const SizedBox(width: 8),
// //         Expanded(
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Text(
// //                 'Events and Shows',
// //                 style: theme.textTheme.titleMedium?.copyWith(
// //                   fontWeight: FontWeight.bold,
// //                 ),
// //               ),
// //               const SizedBox(height: 4),
// //               Text(
// //                 "Find out what's happening: festivals, public gatherings, cultural and sporting events",
// //                 style: theme.textTheme.bodyMedium,
// //               ),
// //             ],
// //           ),
// //         ),
// //       ],
// //     );
// //   }

// //   // =_=-=_=-=_=-=_=-=_=-=_=-=_=-=_=-=_=-=_=-=_ EVENT ITEM =_=-=_=-=_=-=_=-=_=-=_=-=_=-=_=-=_=-=_=-=_

// //   Widget _eventShowItem(BuildContext context, EventShowsModel event) {
// //     final theme = Theme.of(context);
// //     final colorScheme = theme.colorScheme;

// //     return Container(
// //       padding: const EdgeInsets.all(16),
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.circular(14),
// //         boxShadow: const [
// //           BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
// //         ],
// //         border: Border.all(color: Colors.black26),
// //       ),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           // Title + Tag
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Expanded(
// //                 child: Text(
// //                   event.name,
// //                   style: theme.textTheme.titleMedium?.copyWith(
// //                     fontWeight: FontWeight.bold,
// //                     fontSize: 18,
// //                   ),
// //                 ),
// //               ),
// //               Container(
// //                 padding: const EdgeInsets.symmetric(
// //                   horizontal: 10,
// //                   vertical: 4,
// //                 ),
// //                 decoration: BoxDecoration(
// //                   color: Colors.blue.withOpacity(0.3),
// //                   borderRadius: BorderRadius.circular(20),
// //                 ),
// //                 child: Text(
// //                   event.tag,
// //                   style: const TextStyle(
// //                     fontSize: 14,
// //                     fontWeight: FontWeight.w600,
// //                     color: Colors.blue,
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),

// //           const SizedBox(height: 8),

// //           Text(event.description, style: theme.textTheme.titleMedium),

// //           const SizedBox(height: 12),

// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //             children: [
// //               // Location
// //               Row(
// //                 children: [
// //                   const Icon(Icons.location_on_outlined, size: 18),
// //                   const SizedBox(width: 4),
// //                   Text(
// //                     event.location,
// //                     style: theme.textTheme.bodySmall?.copyWith(
// //                       fontWeight: FontWeight.w400,
// //                       fontSize: 16,
// //                     ),
// //                   ),
// //                 ],
// //               ),

// //               // Date range
// //               Row(
// //                 children: [
// //                   const Icon(Icons.calendar_month, size: 18),
// //                   const SizedBox(width: 4),
// //                   Text(
// //                     event.formattedDateRange,
// //                     style: theme.textTheme.bodySmall?.copyWith(
// //                       color: colorScheme.onSurfaceVariant,
// //                       fontSize: 16,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // // ================= DATE RANGE EXTENSION =================

// // extension EventShowsModelExtension on EventShowsModel {
// //   String get formattedDateRange {
// //     if (startdate == null || startdate!.isEmpty) return '';
// //     if (enddate == null || enddate!.isEmpty || startdate == enddate) {
// //       // Single-day event
// //       return DateFormat('MMMM d, yyyy').format(DateTime.parse(startdate!));
// //     }

// //     DateTime start = DateTime.parse(startdate!);
// //     DateTime end = DateTime.parse(enddate!);

// //     // Same month & year: February 2-4, 2025
// //     if (start.month == end.month && start.year == end.year) {
// //       return '${DateFormat('MMMM').format(start)} ${start.day}-${end.day}, ${start.year}';
// //     }

// //     // Same year, different months: February 28 - March 2, 2025
// //     if (start.year == end.year) {
// //       return '${DateFormat('MMMM d').format(start)} - ${DateFormat('MMMM d').format(end)}, ${start.year}';
// //     }

// //     // Different years: December 30, 2024 - January 2, 2025
// //     return '${DateFormat('MMMM d, yyyy').format(start)} - ${DateFormat('MMMM d, yyyy').format(end)}';
// //   }
// // }


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:flutter_eleonoraguzzy/features/information/controller/event_shows_controller.dart';
// import 'package:flutter_eleonoraguzzy/features/information/model/event_shows_model.dart';
// import 'package:intl/intl.dart';
// import 'dart:math';

// class EventsShowsWidget extends StatelessWidget {
//   EventsShowsWidget({super.key});

//   final EventShowsController controller = Get.put(
//     EventShowsController(Get.find()),
//   );

//   // ============ RANDOM COLOR SETUP ============

//   final List<Color> tagColors = [
//     Colors.blue,
//     Colors.red,
//     Colors.green,
//     Colors.purple,
//     Colors.orange,
//     Colors.teal,
//     Colors.indigo,
//     Colors.pink,
//     Colors.brown,
//     Colors.cyan,
//   ];

//   Color getRandomColor() {
//     final random = Random();
//     return tagColors[random.nextInt(tagColors.length)];
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     return Scaffold(
//       backgroundColor: const Color(0xFFF2F6FF),
//       body: Obx(() {
//         if (controller.isLoading.value) {
//           return const Center(child: CircularProgressIndicator());
//         }

//         if (controller.eventShowsList.isEmpty) {
//           return const Center(
//             child: Text(
//               'No events available',
//               style: TextStyle(fontSize: 16),
//             ),
//           );
//         }

//         return SingleChildScrollView(
//           padding: const EdgeInsets.all(12),
//           child: Container(
//             width: double.infinity,
//             padding: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(20),
//               border: Border.all(color: Colors.black26),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 _header(theme),
//                 const SizedBox(height: 24),

//                 ...controller.eventShowsList.map(
//                   (event) => Padding(
//                     padding: const EdgeInsets.only(bottom: 16),
//                     child: _eventShowItem(context, event),
//                   ),
//                 ),

//                 const SizedBox(height: 16),

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
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     style: OutlinedButton.styleFrom(
//                       side: const BorderSide(
//                         color: Colors.blue,
//                         width: 1.5,
//                       ),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       }),
//     );
//   }

//   // ================= HEADER =================

//   Widget _header(ThemeData theme) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Icon(
//           Icons.calendar_today_outlined,
//           color: Colors.green,
//         ),
//         const SizedBox(width: 8),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Events and Shows',
//                 style: theme.textTheme.titleMedium?.copyWith(
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 "Find out what's happening: festivals, public gatherings, cultural and sporting events",
//                 style: theme.textTheme.bodyMedium,
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   // ================= EVENT ITEM =================

//   Widget _eventShowItem(
//     BuildContext context,
//     EventShowsModel event,
//   ) {
//     final theme = Theme.of(context);

//     // pick one random color for THIS event item
//     final Color color = getRandomColor();

//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(14),
//         boxShadow: const [
//           BoxShadow(
//             color: Colors.black12,
//             blurRadius: 6,
//             offset: Offset(0, 3),
//           ),
//         ],
//         border: Border.all(color: Colors.black26),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Title + Tag
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(
//                 child: Text(
//                   event.name,
//                   style: theme.textTheme.titleMedium?.copyWith(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18,
//                   ),
//                 ),
//               ),

//               // ============ UPDATED TAG CONTAINER ============

//               Container(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 10,
//                   vertical: 4,
//                 ),
//                 decoration: BoxDecoration(
//                   color: color,
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Text(
//                   event.tag,
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ],
//           ),

//           const SizedBox(height: 8),

//           Text(
//             event.description,
//             style: theme.textTheme.titleMedium,
//           ),

//           const SizedBox(height: 12),

//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               // Location
//               Row(
//                 children: [
//                   const Icon(
//                     Icons.location_on_outlined,
//                     size: 18,
//                   ),
//                   const SizedBox(width: 4),
//                   Text(
//                     event.location,
//                     style: theme.textTheme.bodySmall?.copyWith(
//                       fontWeight: FontWeight.w400,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ],
//               ),

//               // Date range
//               Row(
//                 children: [
//                   const Icon(
//                     Icons.calendar_month,
//                     size: 18,
//                   ),
//                   const SizedBox(width: 4),
//                   Text(
//                     event.formattedDateRange,
//                     style: theme.textTheme.bodySmall?.copyWith(
//                       fontSize: 16,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ================= DATE RANGE EXTENSION =================

// extension EventShowsModelExtension on EventShowsModel {
//   String get formattedDateRange {
//     if (startdate == null || startdate!.isEmpty) return '';

//     if (enddate == null ||
//         enddate!.isEmpty ||
//         startdate == enddate) {
//       return DateFormat('MMMM d, yyyy').format(
//         DateTime.parse(startdate!),
//       );
//     }

//     DateTime start = DateTime.parse(startdate!);
//     DateTime end = DateTime.parse(enddate!);

//     if (start.month == end.month &&
//         start.year == end.year) {
//       return '${DateFormat('MMMM').format(start)} ${start.day}-${end.day}, ${start.year}';
//     }

//     if (start.year == end.year) {
//       return '${DateFormat('MMMM d').format(start)} - ${DateFormat('MMMM d').format(end)}, ${start.year}';
//     }

//     return '${DateFormat('MMMM d, yyyy').format(start)} - ${DateFormat('MMMM d, yyyy').format(end)}';
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_eleonoraguzzy/features/information/controller/event_shows_controller.dart';
import 'package:flutter_eleonoraguzzy/features/information/model/event_shows_model.dart';
import 'package:intl/intl.dart';

class EventsShowsWidget extends StatelessWidget {
  EventsShowsWidget({super.key});

  final EventShowsController controller = Get.put(
    EventShowsController(Get.find()),
  );

  Color getColorFromTag(String tag) {
    final int hash = tag.hashCode;

    final int r = (hash & 0xFF0000) >> 16;
    final int g = (hash & 0x00FF00) >> 8;
    final int b = (hash & 0x0000FF);

    // keep range 100-255 so colors stay readable & vivid
    return Color.fromARGB(
      255,
      100 + (r % 156),
      100 + (g % 156),
      100 + (b % 156),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF2F6FF),

      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (controller.eventShowsList.isEmpty) {
          return const Center(
            child: Text(
              'No events available',
              style: TextStyle(fontSize: 16),
            ),
          );
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(12),

          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black26),
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _header(theme),

                const SizedBox(height: 24),

                ...controller.eventShowsList.map(
                  (event) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: _eventShowItem(context, event),
                  ),
                ),

                const SizedBox(height: 16),

                SizedBox(
                  width: double.infinity,
                  height: 48,

                  child: OutlinedButton.icon(
                    onPressed: () {},

                    icon: const Icon(
                      Icons.menu_book,
                      color: Colors.blue,
                    ),

                    label: const Text(
                      'Read All the News',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: Colors.blue,
                        width: 1.5,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _header(ThemeData theme) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.calendar_today_outlined,
          color: Colors.green,
        ),

        const SizedBox(width: 8),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Events and Shows',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                "Find out what's happening: festivals, public gatherings, cultural and sporting events",
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _eventShowItem(
    BuildContext context,
    EventShowsModel event,
  ) {
    final theme = Theme.of(context);

    // ONE color for this tag (background + text will match)
    final Color color = getColorFromTag(event.tag);

    return Container(
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),

        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],

        border: Border.all(color: Colors.black26),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // -------- Title + Tag --------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Expanded(
                child: Text(
                  event.name,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),


              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),

                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Text(
                  event.tag,

                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          Text(
            event.description,
            style: theme.textTheme.titleMedium,
          ),

          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              // location
              Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    size: 18,
                  ),

                  const SizedBox(width: 4),

                  Text(
                    event.location,
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),

              // date
              Row(
                children: [
                  const Icon(
                    Icons.calendar_month,
                    size: 16,
                  ),

                  const SizedBox(width: 4),

                  Text(
                    event.formattedDateRange,
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

extension EventShowsModelExtension on EventShowsModel {
  String get formattedDateRange {
    if (startdate == null || startdate!.isEmpty) {
      return '';
    }

    if (enddate == null ||
        enddate!.isEmpty ||
        startdate == enddate) {
      return DateFormat('MMMM d, yyyy').format(
        DateTime.parse(startdate!),
      );
    }

    DateTime start = DateTime.parse(startdate!);
    DateTime end = DateTime.parse(enddate!);

    if (start.month == end.month &&
        start.year == end.year) {
      return '${DateFormat('MMMM').format(start)} ${start.day}-${end.day}, ${start.year}';
    }

    if (start.year == end.year) {
      return '${DateFormat('MMMM d').format(start)} - ${DateFormat('MMMM d').format(end)}, ${start.year}';
    }

    return '${DateFormat('MMMM d, yyyy').format(start)} - ${DateFormat('MMMM d, yyyy').format(end)}';
  }
}