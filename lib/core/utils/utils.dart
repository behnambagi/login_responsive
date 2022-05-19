import 'dart:ui';
import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:logger/logger.dart';

import '../../features/storage/domain/services/local_storage.dart';

const BASE_URL_SERVER = "http://127.0.0.1:8000/api/";

final _logger = Logger();

Logger get logger => _logger;

typedef FVoid = Future<void>;


const LOCALIZATION_UTIL= [
GlobalMaterialLocalizations.delegate,
GlobalWidgetsLocalizations.delegate,
GlobalCupertinoLocalizations.delegate,
];

t(v)=>developer.log(v, name: 'TEST');

//logger for debug

void log(dynamic val) => _logger.d(val);


class GetWithStorage extends GetxController{
  LocalStorage storage =Get.find();
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}
