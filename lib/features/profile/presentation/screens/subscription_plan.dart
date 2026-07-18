import 'package:flutter/material.dart';
import 'package:flutter_eleonoraguzzy/core/common/widget/reactive_button/save_button.dart';
import 'package:flutter_eleonoraguzzy/core/notifiers/button_status_notifier.dart';
import 'package:flutter_eleonoraguzzy/core/theme/app_sizes.dart';

class SubscriptionPlan extends StatelessWidget {
  const SubscriptionPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F6FF),
      appBar: AppBar(
        backgroundColor: Color(0xFFF2F6FF),
        elevation: 0,
        centerTitle: true,
        title: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Subscription Plan",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
            ),
            SizedBox(height: 4),
            Text(
              "Manage your plan and billing",
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: AppSizes.screenPadding,
        children: const [BasicSubscriptionCard(), PremiumSubscriptionCard()],
      ),
    );
  }
}

class BasicSubscriptionCard extends StatelessWidget {
  const BasicSubscriptionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: _buildCard(
        title: "Basic",
        price: "09.99",
        period: "/month",
        description: "Better for large team or company",
        backgroundImagePath: 'assets/images/Subscription.png',
      ),
    );
  }
}

// Premium Card – Pink/Purple design
class PremiumSubscriptionCard extends StatelessWidget {
  const PremiumSubscriptionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: _buildCard(
        title: "Premium",
        price: "39.99",
        period: "/year",
        description: "Better for large team or company",
        backgroundImagePath: 'assets/images/Subscription1.png',
      ),
    );
  }
}

Widget _buildCard({
  required String title,
  required String price,
  required String period,
  required String description,
  required String backgroundImagePath,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8),
    height: 400,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(backgroundImagePath, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    shadows: [
                      Shadow(
                        blurRadius: 8,
                        color: Colors.black45,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "\$$price",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 34,
                        fontWeight: FontWeight.w700,
                        shadows: [
                          Shadow(
                            blurRadius: 10,
                            color: Colors.black54,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      period,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 20),
                Divider(color: Colors.black54.withOpacity(0.3), height: 30),
                const SizedBox(height: 40),
                SizedBox(
                  height: 48,
                  child: RSaveButton(
                    saveText: "Subscribe",
                    loadingText: "Subscribing...",
                    errorText: "Subscription Failed",
                    buttonStatusNotifier: ProcessStatusNotifier(
                      initialStatus: EnabledStatus(),
                    ),
                    onSaveTap: () {},
                    onDone: () {},
                    key: null,
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
