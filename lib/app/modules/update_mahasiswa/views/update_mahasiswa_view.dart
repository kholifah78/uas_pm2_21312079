import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/update_mahasiswa_controller.dart';

class UpdateMahasiswaView extends GetView<UpdateMahasiswaController> {
  const UpdateMahasiswaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Mahasiswa'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: controller.cNama,
                decoration: InputDecoration(labelText: 'Nama Mahasiswa'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: controller.cNpm,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'NPM Mahasiswa'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: controller.cAlamat,
                decoration: InputDecoration(labelText: 'Alamat Mahasiswa'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Panggil fungsi untuk mengupdate mahasiswa di controller
                  controller.updateMahasiswa(
                    Get.arguments, // ID mahasiswa yang akan diubah
                    controller.cNama.text,
                    controller.cNpm.text,
                    controller.cAlamat.text,
                  );
                },
                child: Text('Update Mahasiswa'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
