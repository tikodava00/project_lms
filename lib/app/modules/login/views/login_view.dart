import 'package:eduakksa/app/data/auth_controller.dart';
import 'package:eduakksa/app/modules/register/views/register_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login EduAkksa'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to EduAkksa',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 150),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 30),
            Obx(() => authController.isLoading.value
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () {
                      authController.login(
                        emailController.text,
                        passwordController.text,
                      );
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.black),
                    ),
                  )),
            TextButton(
              onPressed: () {
                Get.to(() => RegisterPage());
              },
              child: Text("Don't have an account? Register"),
            ),
          ],
        ),
      ),
    );
  }
}
