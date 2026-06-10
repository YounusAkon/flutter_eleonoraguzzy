import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/notification_controller.dart';
import '../model/notification_model.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NotificationController controller =
        Get.find<NotificationController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Notifications",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: controller.readAllNotification,
            child: const Text("Mark all read"),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final newNotifications = controller.notifications
            .where((n) => !n.isRead)
            .toList();
        final earlierNotifications = controller.notifications
            .where((n) => n.isRead)
            .toList();

        if (controller.notifications.isEmpty) {
          return const Center(child: Text("No notifications found"));
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (newNotifications.isNotEmpty)
                _buildSection(
                  title: "New",
                  notifications: newNotifications,
                  controller: controller,
                ),
              if (earlierNotifications.isNotEmpty)
                _buildSection(
                  title: "Earlier",
                  notifications: earlierNotifications,
                  controller: controller,
                ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildSection({
    required String title,
    required List<NotificationModel> notifications,
    required NotificationController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 8),
        ...notifications.map((n) => _buildNotificationItem(n, controller)),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildNotificationItem(
  NotificationModel notification,
  NotificationController controller,
) {
  final bool isExpanded = notification.isExpanded;
  final String displayMessage = isExpanded 
      ? notification.message 
      : _getTruncatedMessage(notification.message);

  return InkWell(
    onTap: () {
      controller.toggleNotificationExpand(notification.id);
      if (!notification.isRead) {
        controller.markAsReadById(notification.id);
      }
    },
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: notification.isRead ? Colors.white : Colors.blue.shade50,
        border: const Border(bottom: BorderSide(color: Colors.black12)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  displayMessage,
                  maxLines: isExpanded ? null : 1,
                  overflow: isExpanded ? null : TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.black87,
                    height: 1.3,
                  ),
                ),
                if (!isExpanded && notification.message.length > 60)
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      "Read more...",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.blue.shade700,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                _timeAgo(notification.createdAt),
                style: const TextStyle(fontSize: 12, color: Colors.black54),
              ),
              if (isExpanded)
                const Icon(Icons.keyboard_arrow_up, size: 16, color: Colors.grey),
              if (!isExpanded)
                const Icon(Icons.keyboard_arrow_down, size: 16, color: Colors.grey),
            ],
          ),
        ],
      ),
    ),
  );
}

// Helper to truncate message nicely
String _getTruncatedMessage(String message) {
  const maxLength = 70; // adjust as you like
  if (message.length <= maxLength) return message;
  return '${message.substring(0, maxLength - 3)}...';
}

  /// Simple time formatter (you can replace with timeago package)
  String _timeAgo(DateTime date) {
    final diff = DateTime.now().difference(date);
    if (diff.inMinutes < 1) return "Now";
    if (diff.inMinutes < 60) return "${diff.inMinutes} min";
    if (diff.inHours < 24) return "${diff.inHours} h";
    return "${diff.inDays} d";
  }
}
