import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_get/app/modules/add_mahasiswa/controllers/add_mahasiswa_controller.dart';

class AddMahasiswaView extends StatelessWidget {
  final AddMahasiswaController controller = Get.put(AddMahasiswaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Mahasiswa'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
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
              SizedBox(height: 10),
              TextField(
                controller: controller.cProgramStudi,
                decoration: InputDecoration(labelText: 'Program Studi Mahasiswa'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: controller.cJenisKelamin,
                decoration: InputDecoration(labelText: 'Jenis Kelamin Mahasiswa'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Panggil fungsi untuk menambahkan mahasiswa di controller
                  controller.addMahasiswa(
                    controller.cNama.text,
                    controller.cNpm.text,
                    controller.cAlamat.text,
                    controller.cProgramStudi.text,
                    controller.cJenisKelamin.text,
                  );
                },
                child: Text('Tambah Mahasiswa'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
