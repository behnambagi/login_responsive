import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:panel_resume/core/utils/utils.dart';
import '../../../../core/constans.dart';

const String _BRIGHTNESS = "brightness";
const String _LOCALE = "locale";
const TOKEN_KEY = "tokenKey";


class LocalStorage {
  final GetStorage _storage = GetStorage();

  setStorage() {
    var v = _storage.getKeys();
    log(v);
  }
  setBrightness(Brightness brightness) {
    _storage.write(_BRIGHTNESS, describeEnum(brightness));
  }

  Brightness getBrightness() {
    String brightness =
        _storage.read<String>(_BRIGHTNESS) ?? DEFAULT_BRIGHTNESS;
    if (brightness == describeEnum(Brightness.dark)) return Brightness.dark;
    return Brightness.light;
  }

  setLocal(Locale locale) async {
    await _storage.write(_LOCALE, locale.languageCode);
  }

  Locale getLocale() {
    return Locale(_storage.read(_LOCALE) ?? DEFAULT_LOCALE_LANGUAGE_CODE);
  }

  saveToken(String token)=>_storage.write(TOKEN_KEY, token);

  String? get getToken=>_storage.read(TOKEN_KEY);

}
