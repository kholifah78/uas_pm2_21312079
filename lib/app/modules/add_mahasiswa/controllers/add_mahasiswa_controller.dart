import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddMahasiswaController extends GetxController {
  late TextEditingController cNama;
  late TextEditingController cNpm;
  late TextEditingController cAlamat;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    cNama = TextEditingController();
    cNpm = TextEditingController();
    cAlamat = TextEditingController();
    super.onInit();
  }

  void addMahasiswa(
    String nama,
    String npm,
    String alamat,
  ) async {
    try {
      await firestore.collection('mahasiswa_21312079').add({
        'name': nama,
        'npm': npm,
        'alamat': alamat,
      });

      Get.defaultDialog(
        title: 'Berhasil',
        middleText: 'Berhasil menambahkan data mahasiswa.',
        onConfirm: () {
          _clearTextControllers();
          Get.back();
        },
        textConfirm: 'OK',
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: 'Terjadi kesalahan',
        middleText: 'Gagal menambahkan mahasiswa.',
      );
    }
  }

  void _clearTextControllers() {
    cNama.clear();
    cNpm.clear();
    cAlamat.clear();
  }

  @override
  void onClose() {
    cNama.dispose();
    cNpm.dispose();
    cAlamat.dispose();
    super.onClose();
  }
}
