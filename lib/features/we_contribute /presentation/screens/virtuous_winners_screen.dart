import 'package:flutter/material.dart';
import 'package:flutter_eleonoraguzzy/features/we_contribute%20/controller/virtuous_award_controller.dart';
import 'package:flutter_eleonoraguzzy/features/we_contribute%20/model/virtuous_award_model.dart';
import 'package:get/get.dart';

class VirtuousWinnersScreen extends StatelessWidget {
  const VirtuousWinnersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VirtuousAwardController(Get.find()));

    return Scaffold(
      backgroundColor: const Color(0xFFF5F8FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F8FF),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF1C1C1E)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Discover the Winners',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1C1C1E),
          ),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(color: Color(0xFFFFB300)),
          );
        }

        if (controller.awards.isEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.emoji_events_outlined, size: 56, color: Color(0xFFFFB300)),
                SizedBox(height: 12),
                Text(
                  'No awards found',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF6B7280),
                  ),
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          color: const Color(0xFFFFB300),
          onRefresh: controller.fetchAwards,
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: controller.awards.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              return _AwardCard(award: controller.awards[index]);
            },
          ),
        );
      }),
    );
  }
}

class _AwardCard extends StatelessWidget {
  const _AwardCard({required this.award});

  final VirtuousAwardModel award;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Color(0xFFE8EEF9)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row: trophy + title + year badge
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.emoji_events, color: Color(0xFFFFB300), size: 22),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    award.title ?? 'Virtuous Administration Award',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1C1C1E),
                    ),
                  ),
                ),
                if (award.year != null) ...[
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF8E1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xFFFFB300)),
                    ),
                    child: Text(
                      award.year!,
                      style: const TextStyle(
                        fontSize: 11.5,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFFFB300),
                      ),
                    ),
                  ),
                ],
              ],
            ),

            if (award.description != null) ...[
              const SizedBox(height: 8),
              Text(
                award.description!,
                style: const TextStyle(
                  fontSize: 12.5,
                  color: Color(0xFF6B7280),
                  height: 1.4,
                ),
              ),
            ],

            // Winners list
            if (award.winners != null && award.winners!.isNotEmpty) ...[
              const SizedBox(height: 14),
              const Text(
                'Winners',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF374151),
                ),
              ),
              const SizedBox(height: 8),
              ...award.winners!.map((winner) => _WinnerTile(winner: winner)),
            ],
          ],
        ),
      ),
    );
  }
}

class _WinnerTile extends StatelessWidget {
  const _WinnerTile({required this.winner});

  final String winner;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xFFF9FAFB),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFFE5E7EB)),
        ),
        child: Row(
          children: [
            const Icon(Icons.emoji_events, color: Color(0xFFFFB300), size: 18),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                winner,
                style: const TextStyle(
                  fontSize: 12.5,
                  color: Color(0xFF374151),
                  height: 1.4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
