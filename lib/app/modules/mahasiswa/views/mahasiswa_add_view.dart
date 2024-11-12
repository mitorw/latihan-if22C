import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myapp/app/modules/mahasiswa/controllers/mahasiswa_controller.dart';

class MahasiswaAddView extends GetView<MahasiswaController> {
  const MahasiswaAddView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(MahasiswaController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Mahasiswa'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView(
          children: [
            TextField(
              controller: controller.cNpm,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: "NPM",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.cNama,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                labelText: "Nama",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.cAlamat,
              textInputAction: TextInputAction.done,
              maxLines: 3,
              maxLength: 100,
              decoration: InputDecoration(
                labelText: "Alamat",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity, // Mengisi lebar secara penuh
              child: ElevatedButton(
                onPressed: () {
                  controller.add(
                    controller.cNpm.text,
                    controller.cNama.text,
                    controller.cAlamat.text,
                  );
                },
                child: Text("Simpan"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white, // Warna teks di tombol
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}