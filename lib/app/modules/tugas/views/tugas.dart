import 'package:flutter/material.dart';

class AssignmentSubmissionPage extends StatelessWidget {
  final TextEditingController assignmentTitleController =
      TextEditingController();
  final TextEditingController assignmentDescriptionController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pengumpulan Tugas"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: assignmentTitleController,
              decoration: InputDecoration(
                labelText: "Judul Tugas",
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: assignmentDescriptionController,
              decoration: InputDecoration(
                labelText: "Deskripsi",
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // Logika untuk mengunggah file tugas
                // Dapat membuka file picker untuk memilih file
              },
              icon: Icon(Icons.upload_file),
              label: Text("Unggah File"),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Logika untuk mengirim data tugas
                // Misalnya, mengirim ke server atau menyimpan secara lokal
                // Tampilkan pesan konfirmasi
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Tugas Berhasil Dikumpulkan!")));
              },
              child: Text("Kumpulkan Tugas"),
            ),
          ],
        ),
      ),
    );
  }
}
