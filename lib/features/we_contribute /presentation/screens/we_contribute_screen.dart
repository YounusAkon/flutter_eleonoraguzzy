import 'package:flutter/material.dart';
import 'package:flutter_eleonoraguzzy/features/we_contribute%20/presentation/widget/active_survays_widget.dart';
import 'package:flutter_eleonoraguzzy/features/we_contribute%20/presentation/widget/electoral_progress_reporting.dart';
import 'package:flutter_eleonoraguzzy/features/we_contribute%20/presentation/widget/real_time_comunications_widget.dart';
import 'package:flutter_eleonoraguzzy/features/we_contribute%20/presentation/widget/virtuous_administration_award_widget.dart';

class WeContributeScreen extends StatefulWidget {
  const WeContributeScreen({super.key});

  @override
  State<WeContributeScreen> createState() => _WeContributeScreenState();
}

class _WeContributeScreenState extends State<WeContributeScreen> {
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
              'We Contribute',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Actively participate in the life of your \ncommunity',
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
                  Tab(text: 'Active Services'),
                  Tab(text: 'Electoral Progress Reporting'),
                  Tab(text: 'Real Time Communications'),
                  Tab(text: 'Virtuous Administration Award'),
                ],
              ),

              const SizedBox(height: 8),

              Expanded(
                child: TabBarView(
                  children: [
                    ActiveSurveysScreen(),
                    ElectoralProgressReportingWidget(),
                    RealTimeComunications(),
                    VirtuousAdministrationAwardWidget(),
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
