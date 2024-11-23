import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DosenController extends GetxController {


  late TextEditingController cNidn;
  late TextEditingController cNama;
  late TextEditingController cProdi;
  late TextEditingController cFakultas;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> getData() async {
    CollectionReference dosen = firestore.collection('dosen');
    return dosen.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference dosen = firestore.collection('dosen');
    return dosen.snapshots();
  }

  Future<DocumentSnapshot<Object?>> GetDataById(String id) async {
    DocumentReference docRef = firestore.collection("dosen").doc(id);

    return docRef.get();
  }

  void delete(String id) async {
    DocumentReference docRef = firestore.collection("dosen").doc(id);

    // Show confirmation dialog
    Get.defaultDialog(
      title: "Info",
      middleText: "Apakah anda yakin menghapus data ini?",
      onConfirm: () async {
        try {
          // Perform deletion after confirmation
          await docRef.delete();

          // Show success message once the data is deleted
          Get.back(); // Close the confirmation dialog
          Get.defaultDialog(
            title: "Sukses",
            middleText: "Berhasil menghapus data",
            onConfirm: () {
              Get.back(); // Close success dialog
            },
          );
        } catch (e) {
          print(e);
          // Handle error
          Get.defaultDialog(
            title: "Terjadi Kesalahan",
            middleText: "Tidak berhasil menghapus data",
            onConfirm: () {
              Get.back(); // Close error dialog
            },
          );
        }
      },
      textConfirm: "Ya",
      textCancel: "Batal",
    );
  }

  void Update(
      String nidn, String nama, String prodi, String fakultas, String id) async {
    DocumentReference dosenById = firestore.collection("dosen").doc(id);

    try {
      await dosenById.update({
        "nidn": nidn,
        "nama": nama,
        "prodi": prodi,
        "fakultas": fakultas,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil mengubah data Dosen.",
        onConfirm: () {
          cNidn.clear();
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
        middleText: "Gagal Menambahkan dosen.",
      );
    }
  }

  void add(String nidn, String nama, String prodi, String fakultas) async {
    CollectionReference dosen = firestore.collection("dosen");

    try {
      await dosen.add({
        "nidn": nidn,
        "nama": nama,
        "prodi": prodi,
        "fakultas": fakultas,
      });
      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil menyimpan data dosen",
        textConfirm: "OK",
        onConfirm: () {
          cNidn.clear();
          cNama.clear();
          cProdi.clear();
          cFakultas.clear();
          Get.back();
        },
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan dosen.",
      );
    }
  }

  @override
  void onInit() {
    cNidn = TextEditingController();
    cNama = TextEditingController();
    cProdi = TextEditingController();
    cFakultas = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    cNidn.dispose();
    cNama.dispose();
    cProdi.dispose();
    cFakultas.dispose();
    super.onClose();
  }
}
