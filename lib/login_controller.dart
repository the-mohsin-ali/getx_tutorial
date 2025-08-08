import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class LoginController extends GetxController {
  RxBool loading = false.obs;

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  void loginApi() async {
    loading.value = true;

    try {
      final response = await post(Uri.parse('https://dummyjson.com/auth/login'),
          body: {"username": "emilys", "password": "emilyspass"});

      var data = jsonDecode(response.body);

      if (kDebugMode) {
        print(data);
        print(response.statusCode);
        print('URL: https://dummyjson.com/auth/login');
        print('Email: ${emailController.value.text}');
        print('Password: ${passwordController.value.text}');
      }

      if (response.statusCode == 200) {
        loading.value = false;
        Get.snackbar('Login Successful', 'congratulations '+data['firstName']);
      } else {
        loading.value = false;
        Get.snackbar('Login Failed', data['error']);
      }
    } catch (e) {
      loading.value = false;
      Get.snackbar('Exception', e.toString());
      if (kDebugMode) {
        print("Error: $e");
      }
    }
  }
}
