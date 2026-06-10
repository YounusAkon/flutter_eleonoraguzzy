import 'package:flutter/material.dart';
import '../../../../core/theme/text_style.dart';
import '../widgets/legal_content_widgets.dart';

class Privacypolicy extends StatelessWidget {
  const Privacypolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Privacy Policy",
          style: AppText.xlSemiBold_20_600.copyWith(color: Colors.black),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LegalLastUpdated(date: "June 10, 2026"),
                const LegalParagraph(
                  'Voice ("we", "our", or "us") respects your privacy and is committed to '
                  'protecting your personal information. This Privacy Policy explains how we '
                  'collect, use, disclose, and safeguard your information when you use the '
                  'Voice mobile application and related services.',
                ),

                const LegalSectionTitle("1. Information We Collect"),

                const LegalSubTitle("Personal Information"),
                const LegalParagraph(
                  "When you create an account or use our services, we may collect:",
                ),
                const LegalBulletList([
                  "Full name",
                  "Email address",
                  "Phone number",
                  "Profile photo/avatar",
                  "User account credentials",
                  "OTP verification information",
                ]),

                const LegalSubTitle("User-Generated Content"),
                const LegalParagraph(
                  "We may collect information you voluntarily provide, including:",
                ),
                const LegalBulletList([
                  "Comments and discussions",
                  "Citizens' proposals",
                  "Survey responses",
                  "Feedback and support requests",
                  "Community participation activities",
                ]),

                const LegalSubTitle("Device Information"),
                const LegalParagraph("We may automatically collect:"),
                const LegalBulletList([
                  "Device type and operating system",
                  "App version",
                  "IP address",
                  "Device identifiers",
                  "Language preferences",
                  "Crash reports and analytics data",
                ]),

                const LegalSubTitle("Notification Information"),
                const LegalParagraph(
                  "If enabled, we may collect information necessary to deliver push "
                  "notifications and civic alerts.",
                ),

                const LegalSectionTitle("2. How We Use Your Information"),
                const LegalParagraph("We use collected information to:"),
                const LegalBulletList([
                  "Create and manage user accounts",
                  "Verify identity through OTP authentication",
                  "Deliver civic participation services",
                  "Provide news, tenders, events, and public information",
                  "Facilitate surveys and consultations",
                  "Improve platform performance and user experience",
                  "Send notifications and updates",
                  "Respond to support requests",
                  "Ensure platform security and prevent misuse",
                  "Comply with legal obligations",
                ]),

                const LegalSectionTitle("3. Sharing of Information"),
                const LegalParagraph("We do not sell your personal information."),
                const LegalParagraph("We may share information with:"),
                const LegalBulletList([
                  "Government institutions and municipalities providing services through the platform",
                  "Trusted service providers supporting platform operations",
                  "Analytics and cloud infrastructure providers",
                  "Legal authorities when required by applicable law",
                ]),
                const LegalParagraph(
                  "Any shared information is limited to what is necessary for providing the "
                  "service.",
                ),

                const LegalSectionTitle("4. User Content"),
                const LegalParagraph(
                  "Content submitted by users, including comments, proposals, and public "
                  "discussions, may be visible to other users depending on the functionality of "
                  "the platform.",
                ),
                const LegalParagraph(
                  "Users are responsible for the content they submit and should avoid posting "
                  "confidential or sensitive personal information.",
                ),

                const LegalSectionTitle("5. Data Security"),
                const LegalParagraph(
                  "We implement reasonable technical and organizational measures to protect "
                  "personal information from unauthorized access, loss, misuse, or disclosure.",
                ),
                const LegalParagraph(
                  "However, no electronic transmission or storage system can be guaranteed to be "
                  "completely secure.",
                ),

                const LegalSectionTitle("6. Data Retention"),
                const LegalParagraph(
                  "We retain personal information only for as long as necessary to provide "
                  "services, comply with legal obligations, resolve disputes, and enforce our "
                  "agreements.",
                ),

                const LegalSectionTitle("7. Your Rights"),
                const LegalParagraph(
                  "Depending on your location and applicable laws, you may have the right to:",
                ),
                const LegalBulletList([
                  "Access your personal information",
                  "Correct inaccurate information",
                  "Request deletion of your data",
                  "Withdraw consent where applicable",
                  "Object to certain processing activities",
                  "Request a copy of your personal data",
                ]),
                const LegalParagraph(
                  "Requests may be submitted through the application's support channels.",
                ),

                const LegalSectionTitle("8. Children's Privacy"),
                const LegalParagraph(
                  "Voice is not intended for children under the age required by applicable "
                  "local laws. We do not knowingly collect personal information from children "
                  "without appropriate authorization.",
                ),

                const LegalSectionTitle("9. Third-Party Services"),
                const LegalParagraph(
                  "The application may use third-party services such as:",
                ),
                const LegalBulletList([
                  "Authentication providers",
                  "Cloud hosting services",
                  "Analytics services",
                  "Push notification providers",
                ]),
                const LegalParagraph(
                  "These providers may process information in accordance with their own privacy "
                  "policies.",
                ),

                const LegalSectionTitle("10. International Data Transfers"),
                const LegalParagraph(
                  "Your information may be processed and stored on servers located in different "
                  "countries. By using the application, you consent to such transfers where "
                  "permitted by law.",
                ),

                const LegalSectionTitle("11. Changes to This Privacy Policy"),
                const LegalParagraph(
                  "We may update this Privacy Policy periodically. Any changes will be posted "
                  "within the application and updated with a revised effective date.",
                ),

                const LegalSectionTitle("12. Contact Us"),
                const LegalParagraph(
                  "If you have questions about this Privacy Policy or your personal information, "
                  "please contact:",
                ),
                const LegalBulletList([
                  "Email: support@voiceapp.com",
                  "Organization: Voice",
                  "Website: https://younusakon.github.io/privacy_eleonoraguzzy/",
                ]),
                const LegalParagraph(
                  "By using Voice, you acknowledge that you have read and understood this "
                  "Privacy Policy.",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
