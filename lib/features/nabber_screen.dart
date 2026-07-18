import 'package:flutter/material.dart';
import 'package:flutter_eleonoraguzzy/features/home/presentation/screens/home_screen.dart';
import 'package:flutter_eleonoraguzzy/features/information/presentation/screens/local_national_news.dart';
import 'package:flutter_eleonoraguzzy/features/we_contribute%20/presentation/screens/we_contribute_screen.dart';
import 'package:get/get.dart';
import '../core/theme/app_colors.dart';
import 'public_matter/presentations/screen/public_matter_screen.dart';

class AppGroundController extends GetxController {
  var currentIndex = 0.obs;

  final List<Widget> pages = [
    const HomeScreen(),
    const WeContributeScreen(),
    const PublicMatter(),
    const InformationScreen(),
  ];

  final List<String> labels = [
    "Gamification",
    "We Contribute",
    "Public Matter",
    "Information",
  ];
  final List<String> icons = [
    "assets/icons/appground1.png",
    "assets/icons/appground2.png",
    "assets/icons/appground3.png",
    "assets/icons/appground4.png",
  ];
}

class AppGround extends StatelessWidget {
  const AppGround({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AppGroundController());
    return Obx(
      () => Scaffold(
        body: controller.pages[controller.currentIndex.value],
        bottomNavigationBar: Container(
          height: 75,
          margin: EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(controller.icons.length, (index) {
              final isSelected =  controller.currentIndex.value == index;

              return GestureDetector(
                onTap: () => controller.currentIndex.value = index,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  padding: EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.primarybutton
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        controller.icons[index],
                        width: 28,
                        height: 28,
                        color: isSelected ? Colors.white : Colors.black87,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        controller.labels[index],
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: isSelected ? Colors.white : Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
