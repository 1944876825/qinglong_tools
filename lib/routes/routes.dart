import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:qinglong_tools/pages/home/home_bindings.dart';
import 'package:qinglong_tools/pages/home/home_page.dart';
import 'package:qinglong_tools/pages/login/login_bindings.dart';
import 'package:qinglong_tools/pages/login/login_page.dart';
import 'package:qinglong_tools/pages/work/add_edit_work_page.dart';
import 'package:qinglong_tools/pages/work/work_bindings.dart';
import 'package:qinglong_tools/pages/work/work_page.dart';

List<GetPage<dynamic>> routes = [
  GetPage(
      name: '/login', page: () => const LoginPage(), binding: LoginBindings()),
  GetPage(name: '/home', page: () => const HomePage(), binding: HomeBindings()),
  GetPage(name: '/work', page: () => const WorkPage(), binding: WorkBindings()),
  GetPage(
      name: '/edit_work',
      page: () => const AddOrEditPage(type: AddOrWorkType.edit)),
  GetPage(name: '/add_work', page: () => const AddOrEditPage()),
];
