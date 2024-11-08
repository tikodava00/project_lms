import 'package:flutter/material.dart';

class ExamPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mengerjakan Ujian'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text(
            'Soal 1: Apa itu akuntansi?',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Jawaban Anda',
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Soal 2: Sebutkan 3 jenis laporan keuangan!',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Jawaban Anda',
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Logika untuk submit jawaban ujian
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Jawaban telah disubmit")),
              );
            },
            child: Text("Submit Jawaban"),
          ),
        ],
      ),
    );
  }
}
