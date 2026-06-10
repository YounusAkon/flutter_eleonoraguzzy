import 'package:flutter/material.dart';
import '../../model/electoral_programs_model.dart';

class EnvironmentProgressScreen extends StatelessWidget {
  final ElectoralItem item;

  const EnvironmentProgressScreen({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F6FF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          '${item.label} Progress Details',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Progress Bar: ${item.score ?? 0}% complete',
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 24),

            /// PROGRESS LIST
            Expanded(
              child: ListView.separated(
                itemCount: item.progress?.length ?? 0,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final progress = item.progress![index];

                  return _buildProjectItem(
                    title: progress.title ?? '',
                    progress: progress.percentage ?? 0,
                    color: _getStatusColor(progress.status),
                    icon: progress.status == 'completed'
                        ? Icons.check_circle_outline
                        : Icons.timelapse,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectItem({
    required IconData icon,
    required Color color,
    required String title,
    required int progress,
  }) {
    return Row(
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Text(
          '$progress%',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
      ],
    );
  }

  Color _getStatusColor(String? status) {
    switch (status) {
      case 'completed':
        return Colors.green;
      case 'in-progress':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }
}
