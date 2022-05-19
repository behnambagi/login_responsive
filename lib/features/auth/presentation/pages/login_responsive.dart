import 'package:flutter/material.dart';
import 'package:panel_resume/features/auth/presentation/pages/login_user_pass_desktop.dart';
import '../../../../core/components/screen_type_layout.dart';
import '../../../auth/presentation/pages/login_user_pass_mobile.dart';

class LoginResponsive extends StatelessWidget {
  const LoginResponsive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: LoginUserPassMobile(),
      desktop: const LoginUserPassDesktop(),
      tablet: const LoginUserPassDesktop(),
    );
  }
}
