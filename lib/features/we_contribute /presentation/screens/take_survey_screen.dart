import 'package:flutter/material.dart';
import 'package:flutter_eleonoraguzzy/core/theme/app_colors.dart';
import 'package:flutter_eleonoraguzzy/core/theme/app_sizes.dart';
import 'package:flutter_eleonoraguzzy/features/we_contribute%20/controller/take_surveys_controller.dart';
import 'package:get/get.dart';

class TakeSurveyScreen extends StatelessWidget {
  final String surveyId;

  const TakeSurveyScreen({super.key, required this.surveyId});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      TakeSurveyController(surveyId: surveyId, repository: Get.find()),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF2F6FF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Take the Survey',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: AppSizes.screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ---------- Upload ----------
            GetBuilder<TakeSurveyController>(builder: (c) => _uploadSection(c)),

            const SizedBox(height: 24),
            const _OrDivider(),
            const SizedBox(height: 24),

            const Text(
              'Do you have any suggestions for improving our parks?',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),

            /// ---------- Text ----------
            _textInput(controller),

            const Spacer(),

            /// ---------- Submit ----------
            Obx(
              () => SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: controller.isLoading.value
                      ? null
                      : controller.submitSurvey,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primarybutton,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: controller.isLoading.value
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                          'Submit',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  /// ---------------- Upload Section ----------------
  Widget _uploadSection(TakeSurveyController c) {
    if (c.selectedFile == null) {
      return GestureDetector(
        onTap: c.pickFile,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300, width: 1.5),
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Icon(
                Icons.cloud_upload_outlined,
                size: 40,
                color: Colors.blue[600],
              ),
              const SizedBox(height: 12),
              Text(
                'Upload File',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue[700],
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'PDF up to 10MB',
                style: TextStyle(fontSize: 13, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green, width: 1.5),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Row(
        children: [
          const Icon(Icons.insert_drive_file, color: Colors.green, size: 30),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              c.selectedFile!.name,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.green,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close, color: Colors.red),
            onPressed: c.removeFile,
          ),
        ],
      ),
    );
  }

  /// ---------------- Text Field ----------------
  Widget _textInput(TakeSurveyController controller) {
    return TextField(
      controller: controller.textController,
      maxLength: 300,
      maxLines: 5,
      decoration: InputDecoration(
        hintText: 'Type your answer',
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.all(16),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

/// ---------------- Or Divider ----------------
class _OrDivider extends StatelessWidget {
  const _OrDivider();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Or',
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey[600],
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
