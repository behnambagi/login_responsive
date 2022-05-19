import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../core/utils/ui_utils.dart';
import '../../../../core/widgets/mb_textFiled.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../controllers/auth_controller.dart';

class LoginUserPassMobile extends StatefulWidget {
  const LoginUserPassMobile({Key? key}) : super(key: key);

  @override
  State<LoginUserPassMobile> createState() => _LoginUserPassMobileState();
}

class _LoginUserPassMobileState extends State<LoginUserPassMobile> {
  var controller = Get.put(AuthController());
  final _formKey = GlobalKey<FormBuilderState>();
  var name = true.obs;
  bool isSignUp = false;

  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;
    var w = s.width;
    var h = s.height;
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.05000000074505806),
                  offset: Offset(0, 19),
                  blurRadius: 40)
            ],
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
          child: SingleChildScrollView(
            child: header(w, h),
          ),
        ),
      ),
    );
  }

  Widget header(w, h) => Container(
        alignment: Alignment.center,
        child: Container(
          height: h * 0.9,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.05000000074505806),
                  offset: Offset(0, 19),
                  blurRadius: 40)
            ],
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: h * 0.05, vertical: w * 0.032),
                  width: double.infinity,
                  child: Text('Logo Here',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromRGBO(244, 116, 88, 1),
                          fontSize: w * 0.045)),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: w * 0.0305),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      if (!isSignUp)
                        Text("!!! welcome back",
                            style: TextStyle(
                                fontSize: w * 0.024,
                                fontWeight: FontWeight.bold)),
                      if (!isSignUp) const SizedBox(height: 10),
                      Text(!isSignUp ? "Sign in" : "Sign up",
                          style: TextStyle(
                              fontSize: w * 0.064,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: h * 0.0277),
                      formWidget(w, h)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );

  Widget formWidget(w, h) => FormBuilder(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            MBTextFiled(
                keyName: 'username',
                name: "Username",
                hint: "Username",
                textInputAction: TextInputAction.next,
                valid: [
                  FormBuilderValidators.required(context, errorText: "پر کن"),
                ]),
            if (isSignUp == true)
              MBTextFiled(
                  keyName: 'email',
                  name: "Email",
                  hint: "Email",
                  textInputAction: TextInputAction.next,
                  valid: [
                    FormBuilderValidators.required(context, errorText: "پر کن"),
                    FormBuilderValidators.email(context,
                        errorText: "email not valid"),
                  ]),
            SizedBox(
              height: h * 0.0138,
            ),
            MBTextFiled(
                keyName: "pass",
                name: "password",
                hint: "password",
                subName: "? Forgot password",
                textInputAction: TextInputAction.done,
                onSubmitted: (v) => onTap(),
                keyboardType: TextInputType.visiblePassword,
                obscure: true,
                valid: [
                  FormBuilderValidators.required(context, errorText: "پر کن")
                ]),
            SizedBox(height: h * 0.037),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: onTap,
                child: Container(
                    width: w * 0.25,
                    height: h * 0.089,
                    decoration: const BoxDecoration(
                      color: Color(0xffF47458),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            CupertinoIcons.chevron_forward,
                            color: Colors.white,
                            size: w * 0.057,
                          ),
                          Text(
                            isSignUp ? "SIGN UP" : "SIGN IN",
                            style: TextStyle(
                                fontSize: w * 0.0322, color: Colors.white),
                          ),
                        ])),
              ),
            ),
            SizedBox(height: h * 0.037),
            Align(
                alignment: Alignment.center,
                child: Text.rich(
                  TextSpan(
                      text: isSignUp
                          ? "Do you have an account?"
                          : "I don’t have an account ? ",
                      style: TextStyle(
                          fontSize: w * 0.0422,
                          color: Colors.black.withOpacity(0.2)),
                      children: [
                        TextSpan(
                          text: !isSignUp ? "Sign up" : "Sign in",
                          recognizer: TapGestureRecognizer()
                            ..onTap =
                                () => setState(() => isSignUp = !isSignUp),
                          style: TextStyle(
                              fontSize: w * 0.0422,
                              color: const Color(0xffF47458)),
                        ),
                      ]),
                ))
          ],
        ),
      );

  onTap() async {
    bool isOk = false;
    name.value = !name.value;
    if (!_formKey.currentState!.saveAndValidate()) return;
    var val = _formKey.currentState!.value;
    if (isSignUp) {
      isOk = await controller.registerUser(
          val['username'], val["email"], val["pass"]);
    } else {
      isOk = await controller.loginUser(val['username'], val["pass"]);
    }
    if (isOk) SnackBars.success("You have successfully logged in");
    if (!isOk) SnackBars.hasError("There was a problem logging in");
    // Get.offAllNamed(Routes.SPLASH);
  }
}
