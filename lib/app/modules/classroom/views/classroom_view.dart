import 'package:eduakksa/app/data/class_controller.dart';
import 'package:eduakksa/app/modules/exam/views/exam_view.dart';
import 'package:eduakksa/app/modules/materi/views/materi_view.dart';
import 'package:eduakksa/app/modules/tugas/views/tugas.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClassroomDashboard extends StatelessWidget {
  final ClassController classController = Get.put(ClassController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard Kelas EduAkksa'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Obx(() {
            return GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 2.5),
              ),
              itemCount: classController.classes.length,
              itemBuilder: (context, index) {
                final classItem = classController.classes[index];
                return GestureDetector(
                  onTap: () {
                    // Navigasi berdasarkan kelas yang dipilih
                    if (classItem.title == 'AUDIT') {
                      Get.to(() => AssignmentSubmissionPage());
                    } else if (classItem.title == 'Materi') {
                      Get.to(() => MaterialDownloadPage());
                    } else if (classItem.title == 'EXAM') {
                      Get.to(() => ExamPage());
                    } else {
                      Get.snackbar(
                          "Kelas", "Anda memilih kelas ${classItem.title}");
                    }
                  },
                  child: ClassCard(classItem: classItem),
                );
              },
            );
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddClassDialog();
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }

  // Fungsi untuk menampilkan dialog penambahan kelas baru
  void showAddClassDialog() {
    Get.defaultDialog(
      title: "Tambah Kelas",
      content: ElevatedButton(
        onPressed: () {
          Get.defaultDialog(
            title: "Masukkan Kelas Baru",
            content: ClassForm(),
            textConfirm: "Tambah",
            confirmTextColor: Colors.white,
            onConfirm: () {
              final title = ClassForm.titleController.text;
              final description = ClassForm.descriptionController.text;
              classController.addNewClass(title, description);
              Get.back();
              Get.snackbar("Kelas", "Kelas baru berhasil ditambahkan!");
            },
            textCancel: "Batal",
          );
        },
        child: Text("Tambah Kelas Custom"),
      ),
    );
  }
}

// Widget untuk menampilkan card kelas
class ClassCard extends StatelessWidget {
  final ClassItem classItem;

  const ClassCard({Key? key, required this.classItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              classItem.title,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              classItem.description,
              style: TextStyle(fontSize: 14, color: Colors.white70),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

// Widget untuk form penambahan kelas custom
class ClassForm extends StatelessWidget {
  static final TextEditingController titleController = TextEditingController();
  static final TextEditingController descriptionController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: titleController,
          decoration: InputDecoration(labelText: "Nama Kelas"),
        ),
        TextField(
          controller: descriptionController,
          decoration: InputDecoration(labelText: "Deskripsi Kelas"),
        ),
      ],
    );
  }
}
