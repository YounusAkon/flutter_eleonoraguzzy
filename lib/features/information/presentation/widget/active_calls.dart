import 'package:flutter/material.dart';
import 'package:flutter_eleonoraguzzy/core/theme/app_sizes.dart';
import 'package:flutter_eleonoraguzzy/features/information/controller/active_calls_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_eleonoraguzzy/features/information/model/active_calls_model.dart';
import 'package:intl/intl.dart';

class ActiveCallsWidget extends StatelessWidget {
  const ActiveCallsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final ActivecallsController controller = Get.find<ActivecallsController>();

    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (controller.activeCallsList.isEmpty) {
        return const Center(child: Text("No Active Calls found"));
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.people_alt, color: Colors.blueAccent),
                    SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Active Calls',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Don't miss out on opportunities: competitions, funding, and institutional initiatives.",
                            style: theme.textTheme.bodyMedium,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                ...controller.activeCallsList.map(
                  (ActiveCallsModel call) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: _activeCallItem(context, call),
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        // you can navigate to
                        // full list page here
                      },
                      icon: const Icon(
                        Icons.menu_book,
                        size: 20,
                        color: Colors.blue,
                      ),
                      label: const Text(
                        'Read All the News',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        side: const BorderSide(color: Colors.blue, width: 1.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: Colors.white,
                        elevation: 0,
                        shadowColor: Colors.transparent,
                        fixedSize: const Size.fromHeight(48),
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

  Widget _activeCallItem(BuildContext context, ActiveCallsModel call) {
    final theme = Theme.of(context);
    final seatsText = call.seats != null ? call.seats.toString() : call.seats;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 1,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  call.title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  call.tag,
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
            call.description,
            style: theme.textTheme.titleMedium,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),

          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.calendar_today, size: 16, color: Colors.blueGrey),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  "Deadline: ${formatDeadline(call.deadline)}",
                  style: theme.textTheme.bodySmall?.copyWith(fontSize: 14),
                ),
              ),

              if (seatsText != null)
                Text(
                  "$seatsText Seats",
                  style: theme.textTheme.bodySmall?.copyWith(fontSize: 14),
                )
              else if (seatsText == null && call.ammount != null)
                Text(
                  call.ammount!,
                  style: theme.textTheme.bodySmall?.copyWith(fontSize: 14),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

String formatDeadline(String? deadline) {
  if (deadline == null || deadline.isEmpty) return '';

  try {
    final date = DateTime.parse(deadline);
    return DateFormat('MMMM d, yyyy').format(date);
  } catch (e) {
    return deadline; // fallback if format not ISO
  }
}
