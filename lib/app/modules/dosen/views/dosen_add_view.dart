import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/dosen/controllers/dosen_controller.dart';

class DosenAddView extends GetView<DosenController> {
  const DosenAddView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(DosenController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah dosen'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView(
          children: [
            TextField(
              controller: controller.cNidn,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: "nidn",
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
              controller: controller.cProdi,
              textInputAction: TextInputAction.done,
              maxLines: 3,
              maxLength: 100,
              decoration: InputDecoration(
                labelText: "prodi",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            TextField(
              controller: controller.cFakultas,
              textInputAction: TextInputAction.done,
              maxLines: 3,
              maxLength: 100,
              decoration: InputDecoration(
                labelText: "fakultas",
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
                    controller.cNidn.text,
                    controller.cNama.text,
                    controller.cProdi.text,
                    controller.cFakultas.text,
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