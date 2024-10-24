// Menjalankan program di depan (UI)
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myapp/app/controllers/auth_controller.dart';
import 'package:myapp/app/routes/app_pages.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  final cAuth = Get.find<AuthController>();

   SignupView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Text Login Uniersitas Teknokrat
            const Text(
              "DAFTAR UNIVERSITAS TEKNOKRAT INDONESIA",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(height: 32.0),
            // Email field
            TextField(
              controller: controller.cEmail,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            // Password field
            TextField(
              controller: controller.cPass,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20.0),
            // Login button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  cAuth.signup(
                    controller.cEmail.text,
                    controller.cPass.text,
                  ); // Call login function from controller
                },
                child: const Text('SignUp'),
              ),
            ),
            const SizedBox(height: 20.0),
            // Link for registration
            TextButton(
              onPressed: () {
                Get.toNamed(Routes.LOGIN);
              },
              child: const Text(
                "Sudah Punya Akun? Login Disini",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
     ),
);
}
}