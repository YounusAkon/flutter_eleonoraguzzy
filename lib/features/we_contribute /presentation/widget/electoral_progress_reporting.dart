import 'package:flutter/material.dart';
import 'package:flutter_eleonoraguzzy/features/we_contribute%20/presentation/screens/envirment_progress_details.dart';
import 'package:get/get.dart';
import '../../controller/electoral_programs_controller.dart';
import '../../model/electoral_programs_model.dart';

class ElectoralProgressReportingWidget extends StatelessWidget {
  const ElectoralProgressReportingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ElectoralProgressController>();

    return Scaffold(
      backgroundColor: const Color(0xFFF5F8FF),
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.progressData.isEmpty) {
            return const Center(
              child: Text('No electoral progress data found'),
            );
          }

          final ElectoralProgressModel data =
              controller.progressData.first;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(12),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(color: Color(0xFFE8EEF9)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// HEADER
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/icons/chart.png',
                          height: 28,
                          width: 28,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.title ?? '',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                data.description ?? '',
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    /// ITEMS
                    ...?data.items?.map(
                      (item) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: _buildProgressItem(
                          context: context,
                          item: item,
                          color: _getColor(item.label),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildProgressItem({
    required BuildContext context,
    required ElectoralItem item,
    required Color color,
  }) {
    final value = item.score ?? 0;

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => EnvironmentProgressScreen(item: item),
          ),
        );
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFF9FAFB),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFFE5E7EB)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.label ?? '',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text("$value/100", style: const TextStyle(fontSize: 13)),
              ],
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: value / 100,
              minHeight: 8,
              backgroundColor: const Color(0xFFE5E7EB),
              valueColor: AlwaysStoppedAnimation(color),
            ),
            const SizedBox(height: 6),
            Text(
              "$value% complete",
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF6B7280),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getColor(String? label) {
    switch (label) {
      case 'Environment':
        return const Color(0xFF3EB655);
      case 'Infrastructure':
        return const Color(0xFF3377FF);
      case 'Social':
        return const Color(0xFF9235C4);
      case 'Economy':
        return const Color(0xFFEF4444);
      default:
        return Colors.blue;
    }
  }
}
