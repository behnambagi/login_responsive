import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:panel_resume/core/routes/app_pages.dart';
import 'core/localized_strings.dart';
import 'core/routes/app_routes.dart';
import 'core/themes.dart';
import 'core/utils/utils.dart';
import 'features/storage/domain/services/local_storage.dart';

void main() async {
  await initDependencies();
  debugPaintSizeEnabled = false;

  runApp(GetMaterialApp(
    popGesture: true,
    theme: lightTheme,
    // darkTheme: darkTheme,
    themeMode: ThemeMode.system,
    getPages: AppPages.pages,
    initialRoute: Routes.LOGIN,
    unknownRoute: AppPages.notFound,
    translations: LocalizedStrings(),
    debugShowCheckedModeBanner: false,
    defaultTransition: Transition.fade,
    scrollBehavior: MyCustomScrollBehavior(),
  ));
}

initDependencies() async {
  await GetStorage.init();
  Get.put<LocalStorage>(LocalStorage(), permanent: true);
}
