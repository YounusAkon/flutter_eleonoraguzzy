import 'package:flutter/material.dart';
import 'package:flutter_eleonoraguzzy/core/theme/app_sizes.dart';
import 'package:flutter_eleonoraguzzy/features/tender/screen/tender_details.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter_eleonoraguzzy/core/theme/text_style.dart';
import 'package:flutter_eleonoraguzzy/features/tender/controller/tender_controller.dart';
import 'package:flutter_eleonoraguzzy/features/tender/model/tender_model.dart';

class TenderScreen extends StatelessWidget {
  const TenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TenderController>();

    return Scaffold(
      backgroundColor: const Color(0xFFF2F6FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF2F6FF),
        elevation: 0,
        centerTitle: true,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Tender",
              style: AppText.xlSemiBold_20_600.copyWith(color: Colors.black),
            ),
            const SizedBox(height: 4),
            const Text(
              "Actively participate in the life of your \ncommunity",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),

      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.tenders.isEmpty) {
                return const Center(child: Text("No tenders found"));
              }

              return RefreshIndicator(
                onRefresh: controller.fetchTenders,
                child: ListView.builder(
                  padding: AppSizes.screenPadding,
                  itemCount: controller.tenders.length,
                  itemBuilder: (context, index) {
                    return TenderCard(tender: controller.tenders[index]);
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

/// 🔹 Date formatter helper
String formatDate(String? date) {
  if (date == null || date.isEmpty) return "";
  final parsedDate = DateTime.parse(date);
  return DateFormat('d MMM').format(parsedDate); // 15 Nov
}

class TenderCard extends StatefulWidget {
  final Data tender;

  const TenderCard({super.key, required this.tender});

  @override
  State<TenderCard> createState() => _TenderCardState();
}

class _TenderCardState extends State<TenderCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final tender = widget.tender;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            child: Image.network(
              tender.file?.url ?? "",
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                height: 160,
                color: Colors.grey[200],
                alignment: Alignment.center,
                child: const Icon(Icons.broken_image),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF709FFF),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        "Tender",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Icon(Icons.bookmark_border),
                  ],
                ),

                const SizedBox(height: 8),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        tender.name ?? "",
                        maxLines: 5,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Text(
                      formatDate(tender.date),
                      style: const TextStyle(
                        color: Color(0xFFFF9E1B),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                AnimatedCrossFade(
                  firstChild: Text(
                    tender.description ?? "",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  secondChild: Text(
                    tender.description ?? "",
                    style: const TextStyle(color: Color(0xFF3D3E40)),
                  ),
                  crossFadeState: _isExpanded
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 200),
                ),

                const SizedBox(height: 8),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TenderDetailsScreen(
                          tender: tender, // 👈 pass selected tender
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    "See more",
                    style: TextStyle(
                      color: Color(0xFF2A73FF),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
