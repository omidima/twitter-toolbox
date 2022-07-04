import "dart:core";
import 'dart:developer' as developer;

class Logger {
  static bool _isDebug = false;
  static set setDebugMode(bool value) => _isDebug = value;

  static const _red = "\x1B[31m";
  static const _green = "\x1B[32m";
  static const _cyan = "\x1B[36m";
  static const _yellow = "\x1B[33m";

  static void _printer(String color, String tag, dynamic value) {
    developer.log(
        "$color\n$tag: \n${'-' * 60}\n${_valueHandler(value)} \n${'-' * 60} ");
  }

  static String _valueHandler(dynamic value) {
    String text = "";

    if (value is List) {
      value.forEach((element) {
        text += (element + "\n");
      });
    } else if (value is String) {
      text = value;
    } else if (!value is String) {
      throw "value type is: String or List<String>";
    }

    return text;
  }

  static error(String tag, dynamic value) {
    if (_isDebug) {
      _printer(_red, tag, value);
    }
  }

  static warning(String tag, dynamic value) {
    if (_isDebug) {
      _printer(_yellow, tag, value);
    }
  }

  static info(String tag, dynamic value) {
    if (_isDebug) {
      _printer(_cyan, tag, value);
    }
  }

  static success(String tag, dynamic value) {
    if (_isDebug) {
      _printer(_green, tag, value);
    }
  }
}
