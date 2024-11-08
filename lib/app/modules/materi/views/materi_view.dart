import 'package:flutter/material.dart';

class MaterialDownloadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Download Materi'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Logic download materi, seperti mengambil file dari URL
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Mengunduh materi...")),
            );
          },
          child: Text("Unduh Materi"),
        ),
      ),
    );
  }
}
