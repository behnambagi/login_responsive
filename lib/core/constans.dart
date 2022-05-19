import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

const DEFAULT_HOST = "";
const DEFAULT_BRIGHTNESS = "light";
const DEFAULT_LOCALE_LANGUAGE_CODE = "en";


bBack(dynamic response) async =>  Get.back(result: response);

bTo<T extends Widget>(T to, [Bindings? binding]) async =>
    await Get.to(() => to, binding: binding);