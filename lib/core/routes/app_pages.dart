import 'package:get/get.dart';
import '../../features/auth/presentation/pages/login_responsive.dart';
import '../widgets/not_found_page.dart';
import 'app_routes.dart';

abstract class AppPages {
  static final pages =[
    GetPage(name: Routes.LOGIN, page:()=>  const LoginResponsive()),
    GetPage(name: Routes.NOT_FOUND, page:()=> const NotFoundPage()),
  ];

  static final notFound = GetPage(name: Routes.NOT_FOUND, page:()=> const NotFoundPage());
}