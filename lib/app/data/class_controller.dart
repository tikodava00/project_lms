import 'package:get/get.dart';

class ClassItem {
  final String title;
  final String description;

  ClassItem(this.title, this.description);
}

class ClassController extends GetxController {
  var classes = <ClassItem>[
    ClassItem('AUDIT', 'Kelas Audit Akutansi untuk pengumpulan tugas'),
    ClassItem('EXAM', 'Kelas Ujian Akutansi untuk pengerjaan soal ujian'),
    ClassItem('Materi', 'Download Materi Disini')
  ].obs;

  void addNewClass(String title, String description) {
    classes.add(ClassItem(title, description));
  }
}
