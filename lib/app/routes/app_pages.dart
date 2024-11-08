import 'package:eduakksa/app/modules/classroom/views/classroom_view.dart';
import 'package:eduakksa/app/modules/register/views/register_view.dart';
import 'package:get/get.dart';

import '../modules/login/views/login_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginPage(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterPage(),
    ),
    GetPage(
      name: _Paths.CLASSROOM,
      page: () => ClassroomDashboard(),
    ),
  ];
}
