import 'package:eduakksa/app/modules/classroom/views/classroom_view.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;

  void login(String email, String password) async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2));
    isLoading.value = false;
    Get.snackbar('Login', 'Login successful');
    Get.offAll(
        () => ClassroomDashboard()); // Navigasi ke dashboard setelah login
  }

  void register(String email, String nim, String nama, String password,
      String inisial) async {
    isLoading.value = true;
    // Simulasi proses registrasi
    await Future.delayed(Duration(seconds: 2));
    isLoading.value = false;
    Get.snackbar('Register', 'Registration successful');
    Get.offAll(() => ClassroomDashboard());
  }
}
