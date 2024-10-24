import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/controllers/auth_controller.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final cAuth = Get.find<AuthController>();

   HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'HomeView is working',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20), // Spacer antara teks dan tombol
            ElevatedButton(
              onPressed: () {
                cAuth.logout();
                // Aksi yang ingin dilakukan saat tombol ditekan
                print('ElevatedButton ditekan');
              },
              child: const Text('LogOut'),
            ),
          ],
        ),
      ),
    );
  }
}
