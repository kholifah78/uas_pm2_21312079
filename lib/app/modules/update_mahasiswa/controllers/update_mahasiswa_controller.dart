import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateMahasiswaController extends GetxController {
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

  Future<DocumentSnapshot<Object?>> getData(String id) async {
    DocumentReference docRef = firestore.collection('mahasiswa_21312079').doc(id);
    return docRef.get();
  }

  void updateMahasiswa(
    String id,
    String nama,
    String npm,
    String alamat,
  ) async {
    DocumentReference mahasiswaById = firestore.collection('mahasiswa_21312079').doc(id);

    try {
      await mahasiswaById.update({
        'name': nama,
        'npm': npm,
        'alamat': alamat,
      });

      Get.defaultDialog(
        title: 'Berhasil',
        middleText: 'Berhasil mengubah data mahasiswa.',
        onConfirm: () {
          _clearTextControllers();
          Get.back();
          Get.back();
        },
        textConfirm: 'OK',
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: 'Terjadi kesalahan',
        middleText: 'Gagal mengubah mahasiswa.',
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
