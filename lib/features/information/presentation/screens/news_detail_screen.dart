import 'package:flutter/material.dart';
import 'package:flutter_eleonoraguzzy/features/information/model/local_&_national_news_model.dart';
import 'package:intl/intl.dart';

class NewsDetailsScreen extends StatelessWidget {
  final LocalAndNationalNewsModel news;

  const NewsDetailsScreen({super.key, required this.news});

  String _formatDate(String? isoDate) {
    if (isoDate == null || isoDate.isEmpty) return '';
    try {
      return DateFormat('MMMM d, yyyy').format(DateTime.parse(isoDate).toLocal());
    } catch (_) {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final category = news.category ?? '';
    final formattedDate = _formatDate(news.publishDate);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          category.isNotEmpty ? category : 'News',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category badge + date row
            Row(
              children: [
                if (category.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      category,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                const Spacer(),
                if (formattedDate.isNotEmpty)
                  Text(
                    formattedDate,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 14),

            // Title
            if (news.title != null && news.title!.isNotEmpty)
              Text(
                news.title!,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  height: 1.3,
                ),
              ),

            // Subtitle
            if (news.subTitle != null && news.subTitle!.isNotEmpty) ...[
              const SizedBox(height: 10),
              Text(
                news.subTitle!,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                  height: 1.5,
                ),
              ),
            ],

            const SizedBox(height: 20),

            // Image
            if (news.image?.url != null && news.image!.url!.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  news.image!.url!,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const SizedBox.shrink(),
                ),
              ),

            const SizedBox(height: 20),

            // Description
            if (news.description != null && news.description!.isNotEmpty)
              Text(
                news.description!,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.6,
                  color: Colors.black87,
                ),
              ),

            // Main values (key points)
            if (news.mainValues.isNotEmpty) ...[
              const SizedBox(height: 20),
              const Text(
                'Key Points',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              ...news.mainValues.map(
                (value) => _KeyPointTile(heading: value.heading ?? ''),
              ),
            ],

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class _KeyPointTile extends StatelessWidget {
  const _KeyPointTile({required this.heading});

  final String heading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 6),
            child: Icon(Icons.circle, size: 7, color: Colors.blue),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              heading,
              style: const TextStyle(
                fontSize: 15,
                height: 1.5,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
