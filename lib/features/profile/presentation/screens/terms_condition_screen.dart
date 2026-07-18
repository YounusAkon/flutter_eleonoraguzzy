import 'package:flutter/material.dart';
import 'package:flutter_eleonoraguzzy/core/theme/app_sizes.dart';

import '../../../../core/theme/text_style.dart';
import '../widgets/legal_content_widgets.dart';

class TermsConditionScreen extends StatelessWidget {
  const TermsConditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Terms & Conditions",
          style: AppText.xlSemiBold_20_600.copyWith(color: Colors.black),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: AppSizes.screenPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LegalLastUpdated(date: "June 10, 2026"),
                const LegalParagraph(
                  'Welcome to Voice ("App", "Platform", "Service", "we", "our", or "us").',
                ),
                const LegalParagraph(
                  "These Terms and Conditions govern your access to and use of the Voice "
                  "mobile application, website, and related services. By creating an account "
                  "or using the Platform, you agree to be bound by these Terms.",
                ),
                const LegalParagraph(
                  "If you do not agree with these Terms, please do not use the Platform.",
                ),

                const LegalSectionTitle("1. About Voice"),
                const LegalParagraph(
                  "Voice is a civic participation platform that enables citizens to access "
                  "public information, participate in discussions, engage with community "
                  "initiatives, submit proposals, complete surveys, access educational content, "
                  "and interact with participating public institutions and organizations.",
                ),
                const LegalParagraph(
                  "Voice serves as a communication and engagement platform and does not replace "
                  "official government procedures, legal notices, or governmental "
                  "decision-making processes.",
                ),

                const LegalSectionTitle("2. Eligibility"),
                const LegalParagraph("To use Voice, you must:"),
                const LegalBulletList([
                  "Be at least 13 years old or the minimum legal age required in your jurisdiction.",
                  "Provide accurate and complete registration information.",
                  "Maintain the security of your account credentials.",
                  "Comply with all applicable laws and regulations.",
                ]),
                const LegalParagraph(
                  "You are responsible for all activities conducted through your account.",
                ),

                const LegalSectionTitle("3. Account Registration"),
                const LegalParagraph(
                  "To access certain features, users may be required to create an account.",
                ),
                const LegalParagraph("You agree to:"),
                const LegalBulletList([
                  "Provide accurate and current information.",
                  "Keep your login credentials confidential.",
                  "Notify us immediately of any unauthorized use of your account.",
                  "Update your profile information when necessary.",
                ]),
                const LegalParagraph(
                  "We reserve the right to suspend or terminate accounts containing false, "
                  "misleading, or fraudulent information.",
                ),

                const LegalSectionTitle("4. User Content"),
                const LegalParagraph("Users may submit content including:"),
                const LegalBulletList([
                  "Comments",
                  "Opinions",
                  "Proposals",
                  "Survey responses",
                  "Feedback",
                  "Community contributions",
                ]),
                const LegalParagraph("You retain ownership of your content."),
                const LegalParagraph(
                  "By submitting content to Voice, you grant us a non-exclusive, worldwide, "
                  "royalty-free license to display, distribute, and process that content solely "
                  "for operating and improving the Platform.",
                ),
                const LegalParagraph(
                  "You are solely responsible for the content you publish.",
                ),

                const LegalSectionTitle("5. Prohibited Conduct"),
                const LegalParagraph("You agree not to:"),
                const LegalBulletList([
                  "Post false, misleading, or fraudulent information.",
                  "Harass, threaten, abuse, or intimidate others.",
                  "Publish hateful, discriminatory, or offensive content.",
                  "Upload viruses, malware, or harmful code.",
                  "Attempt unauthorized access to systems or user accounts.",
                  "Impersonate another individual or organization.",
                  "Violate intellectual property rights.",
                  "Use the Platform for illegal activities.",
                  "Manipulate surveys, voting systems, or civic participation mechanisms.",
                ]),
                const LegalParagraph(
                  "Violation of these rules may result in content removal, account suspension, "
                  "or permanent termination.",
                ),

                const LegalSectionTitle(
                  "6. Community Discussions and Proposals",
                ),
                const LegalParagraph(
                  "Voice encourages constructive civic participation.",
                ),
                const LegalParagraph("Users acknowledge that:"),
                const LegalBulletList([
                  "Submitted proposals do not guarantee review, implementation, or adoption by any authority.",
                  "Opinions expressed by users belong solely to the individuals who post them.",
                  "Voice does not endorse or guarantee the accuracy of user-generated content.",
                ]),
                const LegalParagraph(
                  "We reserve the right to moderate, remove, or restrict content that violates "
                  "these Terms.",
                ),

                const LegalSectionTitle(
                  "7. Public Information and News Content",
                ),
                const LegalParagraph(
                  "Information, news, tenders, announcements, and civic updates provided through "
                  "the Platform are for informational purposes only.",
                ),
                const LegalParagraph(
                  "While we strive to provide accurate and timely information, we do not "
                  "guarantee:",
                ),
                const LegalBulletList([
                  "Accuracy",
                  "Completeness",
                  "Availability",
                  "Timeliness",
                ]),
                const LegalParagraph(
                  "Users should verify important information through official sources when "
                  "necessary.",
                ),

                const LegalSectionTitle(
                  "8. Educational Content and Gamification",
                ),
                const LegalParagraph(
                  "The educational modules, quizzes, tests, certificates, voting licenses, "
                  "badges, and social awards available within Voice are intended for learning "
                  "and engagement purposes only.",
                ),
                const LegalParagraph(
                  "Any certificates, licenses, achievements, rankings, or awards issued through "
                  "the Platform are symbolic and do not constitute official government "
                  "certifications, legal qualifications, or voting rights.",
                ),

                const LegalSectionTitle("9. Subscription Services"),
                const LegalParagraph(
                  "Voice may offer free and paid subscription plans, including Basic and "
                  "Premium memberships.",
                ),
                const LegalParagraph("By purchasing a subscription:"),
                const LegalBulletList([
                  "You agree to the pricing displayed at the time of purchase.",
                  "Subscriptions may automatically renew unless canceled before the renewal date.",
                  "Subscription billing is managed through the respective app marketplace (Apple App Store or Google Play Store) where applicable.",
                  "Refunds are governed by the policies of the payment provider or app marketplace.",
                ]),
                const LegalParagraph(
                  "Features included in subscription plans may change from time to time.",
                ),

                const LegalSectionTitle("10. Intellectual Property"),
                const LegalParagraph(
                  "All Platform content, including but not limited to:",
                ),
                const LegalBulletList([
                  "Logos",
                  "Branding",
                  "Software",
                  "Design elements",
                  "Graphics",
                  "Educational materials",
                  "Databases",
                ]),
                const LegalParagraph(
                  "are owned by Voice or its licensors and are protected by applicable "
                  "intellectual property laws.",
                ),
                const LegalParagraph(
                  "You may not copy, modify, distribute, or exploit Platform content without "
                  "prior written permission.",
                ),

                const LegalSectionTitle("11. Privacy"),
                const LegalParagraph(
                  "Your use of the Platform is also governed by our Privacy Policy.",
                ),
                const LegalParagraph(
                  "By using Voice, you acknowledge that your information will be collected and "
                  "processed as described in the Privacy Policy.",
                ),

                const LegalSectionTitle("12. Third-Party Services"),
                const LegalParagraph(
                  "The Platform may integrate with third-party services, including:",
                ),
                const LegalBulletList([
                  "Authentication providers",
                  "Cloud infrastructure providers",
                  "Analytics providers",
                  "Notification services",
                  "Government information sources",
                ]),
                const LegalParagraph(
                  "We are not responsible for the practices, content, or availability of "
                  "third-party services.",
                ),

                const LegalSectionTitle("13. Service Availability"),
                const LegalParagraph(
                  "We strive to maintain continuous access to the Platform but do not guarantee "
                  "uninterrupted service.",
                ),
                const LegalParagraph("We may:"),
                const LegalBulletList([
                  "Modify features",
                  "Perform maintenance",
                  "Update content",
                  "Suspend services temporarily",
                ]),
                const LegalParagraph("without prior notice."),

                const LegalSectionTitle("14. Disclaimer of Warranties"),
                const LegalParagraph(
                  'The Platform is provided on an "AS IS" and "AS AVAILABLE" basis.',
                ),
                const LegalParagraph(
                  "To the maximum extent permitted by law, we disclaim all warranties, "
                  "including:",
                ),
                const LegalBulletList([
                  "Merchantability",
                  "Fitness for a particular purpose",
                  "Non-infringement",
                  "Accuracy of information",
                  "Continuous availability",
                ]),
                const LegalParagraph(
                  "Your use of the Platform is at your own risk.",
                ),

                const LegalSectionTitle("15. Limitation of Liability"),
                const LegalParagraph(
                  "To the fullest extent permitted by law, Voice, its operators, partners, "
                  "employees, and affiliates shall not be liable for:",
                ),
                const LegalBulletList([
                  "Indirect damages",
                  "Consequential damages",
                  "Lost profits",
                  "Data loss",
                  "Service interruptions",
                  "Decisions made based on information obtained through the Platform",
                ]),
                const LegalParagraph(
                  "Our total liability shall not exceed the amount paid by you for the Service "
                  "during the preceding twelve (12) months.",
                ),

                const LegalSectionTitle("16. Termination"),
                const LegalParagraph(
                  "We may suspend or terminate your access to the Platform if:",
                ),
                const LegalBulletList([
                  "You violate these Terms.",
                  "Your activity threatens platform security.",
                  "Required by law.",
                  "The service is discontinued.",
                ]),
                const LegalParagraph(
                  "Upon termination, your right to use the Platform will immediately cease.",
                ),

                const LegalSectionTitle("17. Changes to These Terms"),
                const LegalParagraph(
                  "We may revise these Terms from time to time.",
                ),
                const LegalParagraph(
                  "Updated versions will be posted within the Platform and become effective "
                  "upon publication unless otherwise stated.",
                ),
                const LegalParagraph(
                  "Continued use of the Platform after updates constitutes acceptance of the "
                  "revised Terms.",
                ),

                const LegalSectionTitle("18. Governing Law"),
                const LegalParagraph(
                  "These Terms shall be governed by and interpreted in accordance with the laws "
                  "of the jurisdiction in which the Platform operator is established, without "
                  "regard to conflict of law principles.",
                ),

                const LegalSectionTitle("19. Contact Information"),
                const LegalParagraph(
                  "For questions regarding these Terms and Conditions, please contact:",
                ),
                const LegalBulletList([
                  "Email: support@voiceapp.com",
                  "Website: https://younusakon.github.io/privacy_eleonoraguzzy/",
                  "Organization: Voice – Civic Participation Platform",
                ]),
                const LegalParagraph(
                  "By creating an account or using Voice, you acknowledge that you have read, "
                  "understood, and agreed to these Terms and Conditions.",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
