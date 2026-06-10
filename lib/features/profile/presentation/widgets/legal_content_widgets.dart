import 'package:flutter/material.dart';
import 'package:flutter_eleonoraguzzy/core/theme/app_colors.dart';
import 'package:flutter_eleonoraguzzy/core/theme/text_style.dart';

/// "Last Updated: ..." line shown below the page title.
class LegalLastUpdated extends StatelessWidget {
  const LegalLastUpdated({super.key, required this.date});

  final String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        "Last Updated: $date",
        style: AppText.smRegular_14_400.copyWith(
          color: AppColors.secondaryTextblack,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}

/// A numbered/major section heading (e.g. "1. Information We Collect").
class LegalSectionTitle extends StatelessWidget {
  const LegalSectionTitle(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 8),
      child: Text(
        title,
        style: AppText.lgMedium_18_500.copyWith(
          color: AppColors.primaryTextblack,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

/// A sub-section heading (e.g. "Personal Information").
class LegalSubTitle extends StatelessWidget {
  const LegalSubTitle(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 6),
      child: Text(
        title,
        style: AppText.mdSemiBold_16_600.copyWith(
          color: AppColors.primaryTextblack,
        ),
      ),
    );
  }
}

/// A regular body paragraph.
class LegalParagraph extends StatelessWidget {
  const LegalParagraph(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: AppText.smRegular_14_400.copyWith(
          color: AppColors.primaryTextblack,
          height: 1.5,
        ),
      ),
    );
  }
}

/// A bulleted list of short items.
class LegalBulletList extends StatelessWidget {
  const LegalBulletList(this.items, {super.key});

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items
            .map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "•  ",
                      style: AppText.smRegular_14_400.copyWith(
                        color: AppColors.primaryTextblack,
                        height: 1.5,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        item,
                        style: AppText.smRegular_14_400.copyWith(
                          color: AppColors.primaryTextblack,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
