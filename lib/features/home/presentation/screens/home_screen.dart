import 'package:flutter/material.dart';
import 'package:flutter_eleonoraguzzy/core/common/widget/cache/smart_network_image.dart';
import 'package:flutter_eleonoraguzzy/features/home/presentation/screens/choose_your_journey.dart';
import 'package:flutter_eleonoraguzzy/features/notification/screen/notification_screen.dart';
import 'package:flutter_eleonoraguzzy/features/onbording/common/app_logo.dart';
import 'package:flutter_eleonoraguzzy/features/profile/controller/get_profile_controller.dart';
import 'package:flutter_eleonoraguzzy/features/profile/presentation/screens/profile_screen.dart';
import 'package:flutter_eleonoraguzzy/core/theme/app_sizes.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ProfileController profilecontroller = Get.find<ProfileController>();
  int selectedPetIndex = 1;

  @override
  void initState() {
    super.initState();
    // Retry automatically if the initial authenticated load failed.
    profilecontroller.getCurrentUserProfile();
  }

  final List<Map<String, dynamic>> pets = [
    {'name': 'Cat', 'image': 'assets/icons/cat.png'},
    {'name': 'Dog', 'image': 'assets/icons/dog.png'},
    {'name': 'Cat', 'image': 'assets/icons/cat.png'},
  ];
  final List<Map<String, dynamic>> awards = [
    {
      'image': 'assets/images/planttree.png',
      'title': 'Plant a Tree',
      'subtitle': "Contribute to the municipality’s greenery",
    },
    {
      'image': 'assets/images/planttree.png',
      'title': 'Donate Food',
      'subtitle': "Helping those in need",
    },
    {
      'image': 'assets/images/supportcause.png',
      'title': 'Support a Cause',
      'subtitle': "Support local projects",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F6FF),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 220,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF96B9FF),
                  Color(0xFF3C72F1),
                  Color(0xFF91365F),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: [0.1, 0.4, 0.8],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.screenPaddingValue,
              vertical: 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                Row(
                  children: [
                    AppLogo(height: 40, width: 60),
                    const Spacer(),
                    InkWell(
                      borderRadius: BorderRadius.circular(40),
                      onTap: () {
                        Get.to(() => ProfileScreen());
                      },
                      child: Obx(() {
                        final profile = profilecontroller.profile.value;
                        final avatarUrl = profile?.avatarUrl;

                        if (avatarUrl == null || avatarUrl.isEmpty) {
                          return CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.grey.shade300,
                            child: const Icon(
                              Icons.person,
                              size: 30,
                              color: Colors.white,
                            ),
                          );
                        }

                        return SmartNetworkImage.circle(
                          diameter: 32,
                          imageUrl: avatarUrl,
                          borderRadius: BorderRadius.circular(16),
                        );
                      }),
                    ),

                    const SizedBox(width: 8),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NotificationScreen(),
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.notifications_active_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Text(
                  "The Path of the Conscious Citizen",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Learn about politics and economics to get your “Voting License",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: AppSizes.screenPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Choose your travel Companion",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: List.generate(pets.length, (index) {
                              final pet = pets[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          JourneyScreen(pet: pet),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 140,
                                  width: 100,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                      width: 1,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        blurRadius: 6,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        pet['image'],
                                        height: 85,
                                        width: 60,
                                        fit: BoxFit.contain,
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        pet['name'],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Social Awards
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/socialaward.png',
                          height: 32,
                          width: 32,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(width: 6),
                        Text(
                          "Social Awards",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Unlock these rewards by completing the courses and contributing to the community",
                      style: TextStyle(color: Colors.black54, fontSize: 14),
                    ),
                    const SizedBox(height: 16),

                    // Awards List
                    ...awards.map((award) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: ListTile(
                          leading: Image.asset(
                            award['image'],
                            height: 24,
                            width: 24,
                            fit: BoxFit.contain,
                          ),
                          title: Text(
                            award['title'],
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(award['subtitle']),
                          trailing: const Icon(
                            Icons.radio_button_off_outlined,
                            color: Color.fromARGB(255, 144, 202, 249),
                          ),
                        ),
                      );
                    }),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.emoji_events, color: Colors.amber),
                              SizedBox(width: 8),
                              Text("Your Progress"),
                              Spacer(),
                              Icon(Icons.star, color: Colors.amber, size: 18),
                              Text(
                                " 10 Point",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: LinearProgressIndicator(
                              value: 0.5,
                              backgroundColor: Color(0xFF6D6F73),
                              color: Colors.amber,
                              minHeight: 10,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [Text("Start your journey")],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Footer
                    const Center(
                      child: Text(
                        maxLines: 3,
                        "©2025 Voice Civic Participation Platform. A project to\n bridge the gap between citizens and public \nadministration.",
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
