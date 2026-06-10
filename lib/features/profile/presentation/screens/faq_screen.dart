import 'package:flutter/material.dart';
import 'package:flutter_eleonoraguzzy/core/theme/app_colors.dart';
import 'package:flutter_eleonoraguzzy/core/theme/text_style.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final faqs = [
      {
        'question': 'What do I get with the subscription?',
        'answer':
            'Upgrade your subscription plan to unlock all premium features, including access to multi-country pricing and advanced ride filters.',
      },
      {
        'question': 'Can I use the app without subscribing?',
        'answer':
            'Yes, you can use the basic features for free. A subscription unlocks enhanced tools and more flexibility.',
      },
      {
        'question': 'Is there a free trial available?',
        'answer':
            'Yes, we offer a free trial so you can experience all premium features before subscribing.',
      },
      {
        'question': 'Can I try Premium before paying?',
        'answer':
            'Absolutely. Activate the free trial from the subscription page to explore everything Premium offers.',
      },
      {
        'question': 'Can I use Premium on multiple devices?',
        'answer':
            'Yes, as long as you are logged into the same account, your subscription will work across multiple devices.',
      },
      {
        'question': 'How do I cancel my subscription?',
        'answer':
            'You can cancel your subscription anytime from your device’s app store settings. Your access will continue until the end of the billing period.',
      },
      {
        'question': 'How do I delete my account?',
        'answer':
            'Go to “Settings” > “Delete Account.” Please note this is permanent and cannot be undone.',
      },
      {
        'question': 'Is my personal data safe?',
        'answer':
            'Yes. We follow strict security practices to protect your information and never sell your personal data to third parties.',
      },
      {
        'question': 'What should I do if I have an issue with another user?',
        'answer':
            'You can report users directly from their profile or the chat screen. For urgent safety concerns, please contact local authorities.',
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          'FAQ',
          style: AppText.lgMedium_18_500.copyWith(
            color: AppColors.primaryTextblack,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Container(
        color: AppColors.white,
        child: ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: faqs.length,
          itemBuilder: (context, index) {
            final item = faqs[index];
            return ExpansionTile(
              tilePadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              collapsedIconColor: Colors.blue,
              iconColor: Colors.blue,
              title: Text(
                item['question']!,
                style: AppText.mdSemiBold_16_600.copyWith(
                  color: AppColors.primaryTextblack,
                ),
              ),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    item['answer']!,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
