import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_eleonoraguzzy/core/common/widget/reactive_button/save_button.dart';
import 'package:flutter_eleonoraguzzy/core/notifiers/snackbar_notifier.dart';
import 'package:flutter_eleonoraguzzy/core/theme/app_sizes.dart';
import 'package:flutter_eleonoraguzzy/core/theme/text_style.dart';
import 'package:flutter_eleonoraguzzy/features/profile/controller/edit_profile_controller.dart';
import 'package:flutter_eleonoraguzzy/features/profile/controller/get_profile_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final ProfileEditController controller = Get.put(ProfileEditController());
  final ProfileController profileController = Get.find<ProfileController>();
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (image != null) {
      controller.pickImage(File(image.path));
    }
  }

  @override
  void initState() {
    super.initState();
    controller.nameController.text =
        profileController.profile.value?.name ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F6FF),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFF2F6FF),
        title: Text(
          "Edit Profile",
          style: AppText.xlSemiBold_20_600.copyWith(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.screenPaddingValue,
          vertical: 20,
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),

            Obx(() {
              final picked = controller.pickedImage.value;
              final avatarUrl = profileController.profile.value?.avatarUrl;

              Widget avatar;

              if (picked != null) {
                avatar = CircleAvatar(
                  radius: 60,
                  backgroundImage: FileImage(picked),
                );
              } else if (avatarUrl != null && avatarUrl.isNotEmpty) {
                avatar = CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(avatarUrl),
                );
              } else {
                avatar = CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.grey.shade300,
                  child: const Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.white,
                  ),
                );
              }

              return Stack(
                alignment: Alignment.bottomRight,
                children: [
                  avatar,
                  GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      height: 28,
                      width: 28,
                      decoration: const BoxDecoration(
                        color: Color(0xFF3377FF),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.add_a_photo_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              );
            }),

            const SizedBox(height: 32),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Name",
                style: AppText.smMedium_14_500.copyWith(color: Colors.black),
              ),
            ),
            const SizedBox(height: 8),

            TextField(
              controller: controller.nameController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  // borderSide: BorderSide.none,
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 182, 201, 238),
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Color(0xFF3377FF),
                    width: 1.5,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            /// Save Button
            SizedBox(
              height: 48,
              child: RSaveButton(
                saveText: "Save",
                loadingText: "Saving...",
                errorText: "Save Failed",
                buttonStatusNotifier: controller.processStatusNotifier,
                onSaveTap: () {
                  controller.updateProfile(
                    snackbarNotifier: SnackbarNotifier(context: context),
                  );
                },
                onDone: () {
                  Get.back();
                },
                key: null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
