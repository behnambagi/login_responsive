import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class MBTextFiled extends StatelessWidget {
  const MBTextFiled(
      {Key? key,
      required this.keyName,
      this.name,
      this.hint,
      required this.valid,
      this.obscure,
      this.horizontalPadding,
      this.keyboardType,
      this.subName,
      this.textInputAction,
      this.onSubmitted})
      : super(key: key);

  final String keyName;
  final String? name;
  final String? subName;
  final String? hint;
  final bool? obscure;
  final double? horizontalPadding;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final void Function(String?)? onSubmitted;
  final List<String? Function(String?)> valid;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding ?? 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (subName != null)
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child:
                          Text(subName!, style: const TextStyle(fontSize: 12)),
                    ),
                  ),
                if (name != null)
                  Text(name!,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 7),
            Material(
              color: const Color(0xffFFF6F4),
              borderRadius: BorderRadius.circular(4),
              child: FormBuilderTextField(
                  name: keyName,
                  textDirection: TextDirection.ltr,
                  textInputAction: textInputAction,
                  onSubmitted: onSubmitted,
                  style: const TextStyle(fontSize: 14),
                  keyboardType: keyboardType,
                  obscureText: obscure ?? false,
                  decoration: InputDecoration(
                      hintTextDirection: TextDirection.ltr,
                      hintText: hint,
                      focusedErrorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide.none)),
                  validator: FormBuilderValidators.compose(valid)),
            ),
          ],
        ),
      ),
    );
  }
}

class MBTextFiledMain extends StatelessWidget {
  const MBTextFiledMain(
      {Key? key,
      required this.keyName,
      this.name,
      this.hint,
      required this.valid,
      this.obscure,
      this.horizontalPadding,
      this.keyboardType,
      this.subName,
      this.textInputAction,
      this.onSubmitted, this.readOnly, this.onTap, this.prefixIcon})
      : super(key: key);

  final String keyName;
  final String? name;
  final String? subName;
  final String? hint;
  final bool? obscure;
  final bool? readOnly;
  final Widget? prefixIcon;
  final void Function()? onTap;
  final double? horizontalPadding;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final void Function(String?)? onSubmitted;
  final List<String? Function(String?)> valid;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding ?? 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (subName != null)
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child:
                          Text(subName!, style: const TextStyle(fontSize: 12)),
                    ),
                  ),
                if (name != null)
                  Text(name!,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 7),
            Material(
              borderRadius: BorderRadius.circular(8),
              child: FormBuilderTextField(
                  name: keyName,
                  textDirection: TextDirection.ltr,
                  textInputAction: textInputAction,
                  onTap: onTap,
                  readOnly: readOnly??false,
                  onSubmitted: onSubmitted,
                  style: const TextStyle(fontSize: 14),
                  keyboardType: keyboardType,
                  obscureText: obscure ?? false,
                  decoration: InputDecoration(
                    hintTextDirection: TextDirection.ltr,
                    hintText: hint,
                    filled: true,
                    fillColor: Colors.white,
                    hoverColor: Colors.black12,
                    prefixIcon: prefixIcon,
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12, width: 2)),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12, width: 1)),
                    focusedErrorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 2)),
                  ),
                  validator: FormBuilderValidators.compose(valid)),
            ),
          ],
        ),
      ),
    );}
}
