import 'package:flutter/material.dart';
import 'package:flutter_eleonoraguzzy/core/theme/app_sizes.dart';
import 'package:flutter_eleonoraguzzy/features/tender/model/tender_model.dart';
import 'package:flutter_eleonoraguzzy/features/tender/screen/tender_screen.dart';

class TenderDetailsScreen extends StatefulWidget {
  final Data tender;

  const TenderDetailsScreen({super.key, required this.tender});

  @override
  State<TenderDetailsScreen> createState() => _TenderDetailsScreenState();
}

class _TenderDetailsScreenState extends State<TenderDetailsScreen> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final tender = widget.tender;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        centerTitle: true,
        title: const Text(
          "Tender Details",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: AppSizes.screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                tender.file?.url ?? "",
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.grey[200],
                  child: Icon(Icons.broken_image),
                ),
              ),
            ),

            const SizedBox(height: 16),

            /// Badge + Bookmark
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF6C8CFF),
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

            const SizedBox(height: 12),

            /// Title + Date
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    tender.name ?? "",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  formatDate(tender.date),
                  style: TextStyle(
                    color: Color(0xFFFF9E1B),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Text(
              tender.description ?? "",
              style: const TextStyle(color: Colors.black),
            ),

            SizedBox(height: 12),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "See less",
                style: TextStyle(
                  color: Color(0xFF2A73FF),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
