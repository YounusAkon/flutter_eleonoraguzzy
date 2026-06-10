// import 'package:flutter/material.dart';
// import 'package:flutter_eleonoraguzzy/features/public_matter/model/citizen_proposal_model.dart';
// import 'package:get/get.dart';
// import '../service/public_matter_interface.dart';

// // class PublicMatterController extends GetxController {
// //   final PublicMatterInterface repository;

// //   PublicMatterController(this.repository);

// //   final nameController = TextEditingController();
// //   final commentController = TextEditingController();

// //   final isLoading = false.obs;

// //   Future<void> postComment() async {
// //     if (nameController.text.trim().isEmpty ||
// //         commentController.text.trim().isEmpty) {
// //       Get.snackbar(
// //         'Error',
// //         'Name and comment are required',
// //         backgroundColor: Colors.red,
// //         colorText: Colors.white,
// //       );
// //       return;
// //     }

// //     isLoading.value = true;

// //     final result = await repository.publicMatter(
// //       PublicMatterRequestModel(
// //         name: nameController.text.trim(),
// //         comment: commentController.text.trim(),
// //         category: 'Comments',
// //       ),
// //     );

// //     isLoading.value = false;

// //     result.fold(
// //       (failure) {
// //         Get.snackbar(
// //           'Error',
// //           failure.uiMessage,
// //           backgroundColor: Colors.red,
// //           colorText: Colors.white,
// //         );
// //       },
// //       (PublicMatterModel data) {
// //         nameController.clear();
// //         commentController.clear();

// //         Get.snackbar(
// //           'Success',
// //           'Comment posted successfully',
// //           backgroundColor: Colors.green,
// //           colorText: Colors.white,
// //         );
// //       },
// //     );
// //   }

// //   @override
// //   void onClose() {
// //     nameController.dispose();
// //     commentController.dispose();
// //     super.onClose();
// //   }
// // }

// class PublicMatterController extends GetxController {
//   final PublicMatterInterface service;
//   final String defaultCategory;

//   PublicMatterController(
//     this.service, {
//     required this.defaultCategory,
//   });

//   final nameController = TextEditingController();
//   final commentController = TextEditingController();

//   final isLoading = false.obs;

//   Future<void> postComment() async {
//     if (nameController.text.isEmpty || commentController.text.isEmpty) {
//       Get.snackbar("Error", "Name and comment are required");
//       return;
//     }

//     try {
//       isLoading.value = true;

//       final params = PublicMatterRequestModel(
//         name: nameController.text.trim(),
//         comment: commentController.text.trim(),
//         category: defaultCategory, // ✅ auto from widget
//       );

//       await service.publicMatter(params); // ✅ CORRECT METHOD

//       Get.snackbar("Success", "$defaultCategory submitted successfully");

//       nameController.clear();
//       commentController.clear();
//     } catch (e) {
//       Get.snackbar("Error", e.toString());
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_eleonoraguzzy/features/public_matter/model/citizen_proposal_model.dart';
import 'package:flutter_eleonoraguzzy/features/public_matter/service/public_matter_interface.dart';
import 'package:get/get.dart';

class PublicMatterController extends GetxController {
  final PublicMatterInterface service;
  final String defaultCategory;

  PublicMatterController(
    this.service, {
    required this.defaultCategory, // dynamic
  });

  final nameController = TextEditingController();
  final commentController = TextEditingController();
  final isLoading = false.obs;

  Future<void> postComment() async {
    if (nameController.text.isEmpty || commentController.text.isEmpty) {
      Get.snackbar("Error", "Name and comment are required");
      return;
    }

    try {
      isLoading.value = true;

      final params = PublicMatterRequestModel(
        name: nameController.text.trim(),
        comment: commentController.text.trim(),
        category: defaultCategory, // <- use whatever is passed
      );

      await service.publicMatter(params);

      Get.snackbar("Success", "$defaultCategory submitted successfully");

      nameController.clear();
      commentController.clear();
    } finally {
      isLoading.value = false;
    }
  }
}
