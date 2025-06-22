import 'package:cross_platform_ui/cross_platform_type.dart';
import 'package:cross_platform_ui/cross_platform_ui.dart';

class CrossPlatformDeviceType {
  static CrossPlatformType? setting;
  static CrossPlatformType settingMain = CrossPlatformType.material;
  static CrossPlatformType? settingAndroid;
  static CrossPlatformType? settingIOS = CrossPlatformType.cupertino;
  static CrossPlatformType? settingWindows = CrossPlatformType.fluent;
  static CrossPlatformType? settingMacOS = CrossPlatformType.cupertino;
  static CrossPlatformType? settingLinux;
  static CrossPlatformType? settingWeb;
  static CrossPlatformType? settingWebAndroid;
  static CrossPlatformType? settingWebIOS = CrossPlatformType.cupertino;
  static CrossPlatformType? settingWebWindows = CrossPlatformType.fluent;
  static CrossPlatformType? settingWebMacOS = CrossPlatformType.cupertino;
  static CrossPlatformType? settingWebLinux;
  CrossPlatformDeviceType({
    CrossPlatformType? main,
    CrossPlatformType? android,
    CrossPlatformType? ios,
    CrossPlatformType? windows,
    CrossPlatformType? macOS,
    CrossPlatformType? linux,
    CrossPlatformType? web,
    CrossPlatformType? webAndroid,
    CrossPlatformType? webIOS,
    CrossPlatformType? webWindows,
    CrossPlatformType? webMacOS,
    CrossPlatformType? webLinux,
    this.force = false,
  }) : main = main ?? settingMain,
       android = android ?? settingAndroid,
       ios = ios ?? settingIOS,
       windows = windows ?? settingWindows,
       macOS = macOS ?? settingMacOS,
       linux = linux ?? settingLinux,
       web = web ?? settingWeb,
       webAndroid = webAndroid ?? settingWebAndroid,
       webIOS = webIOS ?? settingWebIOS,
       webWindows = webWindows ?? settingWebWindows,
       webMacOS = webMacOS ?? settingWebMacOS,
       webLinux = webLinux ?? settingWebLinux;
  final CrossPlatformType main;
  final CrossPlatformType? android;
  final CrossPlatformType? ios;
  final CrossPlatformType? windows;
  final CrossPlatformType? macOS;
  final CrossPlatformType? linux;
  final CrossPlatformType? web;
  final CrossPlatformType? webAndroid;
  final CrossPlatformType? webIOS;
  final CrossPlatformType? webWindows;
  final CrossPlatformType? webMacOS;
  final CrossPlatformType? webLinux;
  final bool force;
  CrossPlatformUi data(Map<CrossPlatformType, dynamic Function()> datas) {
    if (!datas.containsKey(main)) {
      throw ArgumentError(
        'datas must contain a data for the main type: ${main.name}',
      );
    } else if (setting != null) {
      return CrossPlatformUi(
        dataDefault: force ? datas[main] : (datas[setting!] ?? datas[main]),
      );
    }
    return CrossPlatformUi(
      dataDefault: datas[main],
      dataAndroid: force ? datas[main] : datas[android],
      dataIOS: force ? datas[main] : datas[ios],
      dataWindows: force ? datas[main] : datas[windows],
      dataMacOS: force ? datas[main] : datas[macOS],
      dataLinux: force ? datas[main] : datas[linux],
      dataWeb: force ? datas[main] : datas[web],
      dataWebAndroid: force ? datas[main] : (datas[webAndroid] ?? datas[web]),
      dataWebIOS: force ? datas[main] : (datas[webIOS] ?? datas[web]),
      dataWebWindows: force ? datas[main] : (datas[webWindows] ?? datas[web]),
      dataWebMacOS: force ? datas[main] : (datas[webMacOS] ?? datas[web]),
      dataWebLinux: force ? datas[main] : (datas[webLinux] ?? datas[web]),
    );
  }
}
