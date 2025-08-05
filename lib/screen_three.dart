import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenThree extends StatelessWidget {
  const ScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("Go back")),
          TextButton(
              onPressed: () {
                Get.back();
                Get.back();
              },
              child: const Text("Go back 2 times")),
        ],
      ),
    );
  }
}
