import 'package:flutter/material.dart';
import 'package:flutter_eleonoraguzzy/features/information/presentation/widget/active_calls.dart';
import 'package:flutter_eleonoraguzzy/features/information/presentation/widget/events_shows_widget.dart';
import 'package:flutter_eleonoraguzzy/features/information/presentation/widget/local_&_national_news.dart';
import 'package:flutter_eleonoraguzzy/features/information/presentation/widget/political_party_card.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({super.key});

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
              'Information',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Stay up to date for an aware and informed \ncitizenry',
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
          length: 4, // Update to 4 tabs
          child: Column(
            children: [
              // Tabs
              TabBar(
                isScrollable: true,
                labelColor: colorScheme.primary,
                unselectedLabelColor: colorScheme.onSurfaceVariant,
                indicatorColor: colorScheme.primary,
                labelStyle: const TextStyle(fontWeight: FontWeight.w600),
                tabs: const [
                  Tab(text: 'Local and National News'),
                  Tab(text: 'Political Party Cards'),
                  Tab(text: 'Events & Shows'),
                  Tab(text: 'Active Calls'),
                ],
              ),

              const SizedBox(height: 8),

              Expanded(
                child: TabBarView(
                  children: [
                    LocalAndNationalNewsWidget(),
                    PoliticalPartyWidget(),
                    EventsShowsWidget(),
                    ActiveCallsWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
