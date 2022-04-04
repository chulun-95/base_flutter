import 'dart:io';
import 'package:getx_prj_base/app_config.dart';
import 'package:stack_trace/stack_trace.dart';
import 'package:path_provider/path_provider.dart';

class Logger {
  static final bool isLog = (AppConfig().buildType == BuildType.dev);
  static final int level = Type.debug.index;
  static const String tag = 'App ConsoleLog';
  static String? _appDocPath;

  static Future<String?> getAppDocPath() async {
    if (_appDocPath == null) {
      Directory appDocDir = await getTemporaryDirectory();
      _appDocPath = appDocDir.path;
    }
    return _appDocPath;
  }

  static Future<String?> getFilePath() async {
    String? path = await getAppDocPath();
    if (path != null) {
      return '$path/app_log.txt';
    }
    return null;
  }

  static debug(dynamic msg, {bool logToFile = false}) {
    _log(Type.debug, msg, logToFile: logToFile);
  }

  static info(dynamic msg, {bool logToFile = false}) {
    _log(Type.info, msg, logToFile: logToFile);
  }

  static warning(dynamic msg, {bool logToFile = false}) {
    _log(Type.waring, msg, logToFile: logToFile);
  }

  static error(dynamic msg, {bool logToFile = false}) {
    _log(Type.error, msg, logToFile: logToFile);
  }

  static _log(Type type, dynamic msg, {bool logToFile = false}) async {
    try {
      if (isLog && type.index >= level) {
        final now = DateTime.now();
        String time =
            '${now.year}/${now.month}/${now.day} ${now.hour}:${now.minute}:${now.second}:${now.millisecond}';
        String? screen = Trace.current().frames[2].member?.split(".")[0];
        String? widget = Trace.current().frames[2].member?.split(".")[1];
        String prefix = '$tag - ${type.toString()} - $time - $screen - $widget';
        print('$prefix : $msg');
        if (logToFile) {
          String data = '[$time]: $msg\n\n';
          // WriteLogHelper().push(data);
        }
      }
    } catch (error) {
      if (isLog && type.index >= level) {
        print('$msg');
      }
    }
  }
}

enum Type {
  debug,
  info,
  waring,
  error,
}
