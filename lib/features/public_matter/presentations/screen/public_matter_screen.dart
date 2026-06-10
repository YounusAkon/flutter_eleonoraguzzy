import 'package:flutter/material.dart';
import 'package:flutter_eleonoraguzzy/features/public_matter/presentations/widget/comment_widget.dart';
import 'package:flutter_eleonoraguzzy/features/public_matter/presentations/widget/public_matter_widget.dart';

class PublicMatter extends StatelessWidget {
  const PublicMatter({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: Color(0xFFF2F6FF),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Voice of the Citizens',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Express comments, propose ideas and participate in constructive discussion.',
              textAlign: TextAlign.center,
              maxLines: 3,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ],
        ),
      ),
      body: Container(
        color: Color(0xFFF2F6FF),
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              TabBar(
                labelColor: colorScheme.primary,
                unselectedLabelColor: colorScheme.onSurfaceVariant,
                indicatorColor: colorScheme.primary,
                labelStyle: TextStyle(fontWeight: FontWeight.w600),
                unselectedLabelStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                tabs: [
                  Tab(text: 'Comments'),
                  Tab(text: 'Citizens proposals'),
                ],
              ),
              SizedBox(height: 8),

              Expanded(
                child: TabBarView(
                  children: [CommentWidget(), PublicMatterWidget()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
