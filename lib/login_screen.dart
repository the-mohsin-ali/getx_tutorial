import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: controller.emailController.value,
              decoration: const InputDecoration(hintText: 'Email'),
            ),
            TextFormField(
              controller: controller.passwordController.value,
              decoration: const InputDecoration(hintText: 'Password'),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx((){
              return InkWell(
              onTap: (){
                controller.loginApi();
              },
              child: controller.loading.value ? const CircularProgressIndicator() : Container(
                height: 45,
                color: Colors.grey,
                child: const Center(child: Text("Login")),
              ),
            );
            })
          ],
        ),
      ),
    );
  }
}
