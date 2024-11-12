
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MahasiswaController extends GetxController {
  // Implementasi MahasiswaController

  late TextEditingController cNpm;
  late TextEditingController cNama;
  late TextEditingController cAlamat;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> getData() async {
    CollectionReference mahasiswa = firestore.collection('mahasiswa');
    return mahasiswa.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference mahasiswa = firestore.collection('mahasiswa');
    return mahasiswa.snapshots();
  }
Future<DocumentSnapshot<Object?>> GetDataById(String id) async {
    DocumentReference docRef = firestore.collection("mahasiswa").doc(id);

    return docRef.get();
}
void Update(String npm, String nama, String id, String alamat) async {
    DocumentReference mahasiswaById = firestore.collection("mahasiswa").doc(id);

    try {
      await mahasiswaById.update({
        "npm": npm,
        "nama": nama,
        "alamat": alamat,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil mengubah data Mahasiswa.",
        onConfirm: () {
          cNpm.clear();
          cNama.clear();
          Get.back();
          Get.back();
        },
        textConfirm: "OK",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan Mahasiswa.",
  );
}
}

  void add(String npm, String nama, String alamat) async {
    CollectionReference mahasiswa = firestore.collection("mahasiswa");

    try {
      await mahasiswa.add({
        "npm": npm,
        "nama": nama,
        "alamat": alamat,
      });
      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil menyimpan data mahasiswa",
        textConfirm: "OK",
        onConfirm: () {
          cNpm.clear();
          cNama.clear();
          cAlamat.clear();
          Get.back();
          Get.back();
        },
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan Mahasiswa.",
      );
    }
  }

  @override
  void onInit() {
    cNpm = TextEditingController();
    cNama = TextEditingController();
    cAlamat = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    cNpm.dispose();
    cNama.dispose();
    cAlamat.dispose();
    super.onClose();
  }
}
