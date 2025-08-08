// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ScreenTwo extends StatelessWidget {
  var name;
  ScreenTwo({
    super.key,
    this.name = '',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Get.arguments[0]),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text("Go Back")),
            TextButton(
                onPressed: () {
                  Get.toNamed('/screen_three');
                },
                child: const Text("Go to screen three")),
          ],
        ),
      ),
    );
  }
}
