import 'dart:async';

import 'package:flutter/services.dart';

class Hello {
  static const MethodChannel _channel =
      const MethodChannel('hello');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
   static Future<num> get battery async {
    final num battery = await _channel.invokeMethod('getBattery');
    return battery;
  }
}
