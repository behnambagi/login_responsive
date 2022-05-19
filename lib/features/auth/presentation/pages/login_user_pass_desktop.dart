import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:panel_resume/core/utils/ui_utils.dart';
import 'package:panel_resume/core/widgets/mb_textFiled.dart';
import 'package:panel_resume/features/auth/presentation/controllers/auth_controller.dart';

class LoginUserPassDesktop extends StatefulWidget {
 const LoginUserPassDesktop({Key? key}) : super(key: key);

  @override
  State<LoginUserPassDesktop> createState() => _LoginUserPassDesktopState();
}
class _LoginUserPassDesktopState extends State<LoginUserPassDesktop> {
  var controller = Get.put(AuthController());
  final _formKey = GlobalKey<FormBuilderState>();
  var name = true.obs;
  bool isSignUp = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Stack(
          children: [
            header(size),
            ...vector(size),
          ],
        ),
      )
    );
  }
  
  Widget header(Size size) => Row(
      children: [
        Container(
          width: size.width * 0.42,
          color: const Color(0xffFFEDE1),
        ),
        Container(
          width: size.width * 0.58,
          alignment: Alignment.center,
          child: Container(
            width: size.width * 0.311,
            height: size.height * 0.75,
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
                        horizontal: size.height * 0.05, vertical: size.width * 0.032),
                    width: double.infinity,
                    child: Text('Logo Here',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: const Color.fromRGBO(244, 116, 88, 1),
                            fontSize: size.width * 0.015)),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: size.width * 0.0305),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        if(!isSignUp) const Text("!!! welcome back"),
                        if(!isSignUp) const SizedBox(height: 10),
                        Text(!isSignUp?"Sign in":"Sign up",
                            style: TextStyle(
                                fontSize: size.width * 0.024,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: size.height * 0.0277),
                        formWidget(size)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );

  List<Widget> vector(Size size) { return [
      Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: size.height*0.066),
            child: const Divider(height: 5,color: Color.fromRGBO(244, 116, 88, 1),),
          )),
      Align(
        alignment: Alignment.bottomRight,
        child: Container(
            margin:  EdgeInsets.only(right: size.width*0.089, bottom: size.height*0.066),
            width: size.width*0.38,
            height: size.height*0.68,
            child: Obx(() =>SvgPicture.asset(name.value!=true?"assets/images/vectorOne.svg":"assets/images/vectorTwo.svg"))),
      ),
    ];}

  Widget formWidget(Size size) => FormBuilder(
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
                FormBuilderValidators.required(context, errorText: "پر کن"),]),
          if(isSignUp==true)MBTextFiled(
              keyName: 'email',
              name: "Email",
              hint: "Email",
              textInputAction: TextInputAction.next,
              valid: [
                FormBuilderValidators.required(context, errorText: "پر کن"),
                FormBuilderValidators.email(context, errorText: "email not valid"),
              ]),
          SizedBox(
            height: size.height * 0.0138,
          ),
          MBTextFiled(
              keyName: "pass",
              name: "password",
              hint: "password",
              subName: "? Forgot password",
              textInputAction: TextInputAction.done,
              onSubmitted: (v)=>onTap(),
              keyboardType: TextInputType.visiblePassword,
              obscure: true,
              valid: [
                FormBuilderValidators.required(context, errorText: "پر کن")
              ]),
          SizedBox(height: size.height*0.037),
          Align(
            alignment: Alignment.center,
            child: InkWell(
              onTap: onTap,
              child: Container(
                  width: size.width*0.09,
                  height: size.height*0.059,
                  decoration: const BoxDecoration(
                    color: Color(0xffF47458),
                    borderRadius: BorderRadius.all(Radius.circular(25)),),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(CupertinoIcons.chevron_forward, color: Colors.white, size: size.width*0.017,),
                        Text(isSignUp?"SIGN UP":"SIGN IN", style: TextStyle(
                            fontSize: size.width*0.0122,color: Colors.white),),
                      ])),
            ),
          ),
          SizedBox(height:size.height*0.037),
          Align(
              alignment: Alignment.center,
              child:Text.rich(
                TextSpan(text: isSignUp?"Do you have an account?":
                "I don’t have an account ? ",
                    style: TextStyle(
                        fontSize: size.width*0.0122,
                        color: Colors.black.withOpacity(0.2)
                    ),
                    children:  [
                      TextSpan(text: !isSignUp?"Sign up":"Sign in",
                        recognizer: TapGestureRecognizer()..onTap
                        = () =>setState(()=> isSignUp = !isSignUp),
                        style: TextStyle(
                            fontSize: size.width*0.0122,
                            color: const Color(0xffF47458)
                        ),
                      ),
                    ]) ,


              )
          )
        ],
      ),
    );

  onTap()async{
    bool isOk = false;
    name.value = !name.value;
    if (!_formKey.currentState!.saveAndValidate()) return;
    var val = _formKey.currentState!.value;
    if(isSignUp) {
      isOk = await controller.registerUser(val['username'], val["email"], val["pass"]);
    } else{
      isOk = await controller.loginUser(val['username'], val["pass"]);
    }
    if(isOk)SnackBars.success("You have successfully logged in");
    if (!isOk) SnackBars.hasError("There was a problem logging in");
    // Get.offAllNamed(Routes.SPLASH);
  }

}
