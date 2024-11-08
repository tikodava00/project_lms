import 'package:eduakksa/app/data/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  final AuthController authController = Get.find();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nimController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController inisialController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register EduAkksa'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to EduAkksa',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 32),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: namaController,
                decoration: InputDecoration(labelText: 'Nama'),
              ),
              TextField(
                controller: nimController,
                decoration: InputDecoration(labelText: 'NIM'),
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
              ),
              SizedBox(height: 20),
              Obx(() => authController.isLoading.value
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        authController.register(
                          emailController.text,
                          nimController.text,
                          namaController.text,
                          passwordController.text,
                          inisialController.text,
                        );
                      },
                      child: Text('Register'),
                    )),
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("Already have an account? Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
