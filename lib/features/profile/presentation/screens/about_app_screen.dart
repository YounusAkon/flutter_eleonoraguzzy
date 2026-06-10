import 'package:flutter/material.dart';

import '../../../../core/theme/text_style.dart';
import '../widgets/legal_content_widgets.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "About Voice",
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
                const LegalParagraph(
                  "Voice is a digital civic participation platform designed to connect "
                  "citizens with local governments, public institutions, and community "
                  "initiatives.",
                ),
                const LegalParagraph(
                  "Our mission is to promote transparency, civic engagement, and informed "
                  "participation by providing a centralized platform where citizens can access "
                  "public information, engage in discussions, contribute ideas, and participate "
                  "in community decision-making processes.",
                ),

                const LegalSectionTitle("Through Voice, users can:"),
                const LegalBulletList([
                  "Stay informed with local and national news updates.",
                  "Discover public events, community activities, and government announcements.",
                  "Access public tenders and procurement opportunities.",
                  "Participate in surveys, consultations, and civic initiatives.",
                  "Submit proposals and share opinions on matters affecting their communities.",
                  "Track electoral promises, public projects, and administrative progress.",
                  "Learn about politics, economics, and civic institutions through interactive educational content.",
                  "Earn achievements and recognition through community-focused activities and social contributions.",
                ]),

                const LegalParagraph(
                  "Voice aims to empower individuals to become active participants in shaping "
                  "stronger, more transparent, and more connected communities.",
                ),
                const LegalParagraph(
                  "Whether you want to stay informed, contribute ideas, monitor public "
                  "initiatives, or simply become a more engaged citizen, Voice provides the "
                  "tools and resources to make your participation meaningful.",
                ),
                const LegalParagraph(
                  "Together, we can build better communities through informed civic engagement.",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
