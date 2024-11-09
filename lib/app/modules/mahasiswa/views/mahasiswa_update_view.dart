import 'package:flutter/material.dart';

import 'package:get/get.dart';

class MahasiswaUpdateView extends GetView {
  const MahasiswaUpdateView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MahasiswaUpdateView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MahasiswaUpdateView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
