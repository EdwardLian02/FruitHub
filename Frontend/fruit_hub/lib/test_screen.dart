import 'package:flutter/material.dart';
import 'package:fruit_hub/controller/profile_controller.dart';
import 'package:get/get.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 💡 Best Practice: Use Get.find() if you know it's already created,
    // or Get.put() if you are sure this is the creation point.
    final profileController = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(),
      body: Obx(() {
        if (profileController.isLoading.isTrue) {
          return const Center(child: Text("Loading..."));
        }

        if (profileController.isError.isTrue) {
          return Center(
              child: Text("Error: ${profileController.errorMessage.value}"));
        }

        // ⭐️ Check 2: Safely check if the user object is null
        final userData = profileController.user.value;

        if (userData == null) {
          return const Center(child: Text("User data not available."));
        }

        // ⭐️ Access the data safely
        return Center(
          child: Text(userData.email ?? "Email not set"),
        );
      }),
    );
  }
}
