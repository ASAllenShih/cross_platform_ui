import 'package:asallenshih_flutter_util/platform.dart';
import 'package:flutter/widgets.dart';

class CrossPlatformUi {
  CrossPlatformUi({
    required dynamic dataDefault,
    dynamic dataAndroid,
    dynamic dataIOS,
    dynamic dataWindows,
    dynamic dataMacOS,
    dynamic dataLinux,
    dynamic dataWeb,
    dynamic dataWebAndroid,
    dynamic dataWebIOS,
    dynamic dataWebWindows,
    dynamic dataWebMacOS,
    dynamic dataWebLinux,
  }) {
    final dynamic getData = Platform.current == Platforms.android
        ? dataAndroid ?? dataDefault
        : Platform.current == Platforms.ios
        ? dataIOS ?? dataDefault
        : Platform.current == Platforms.windows
        ? dataWindows ?? dataDefault
        : Platform.current == Platforms.macOS
        ? dataMacOS ?? dataDefault
        : Platform.current == Platforms.linux
        ? dataLinux ?? dataDefault
        : (Platform.current?.isWeb ?? false)
        ? (Platform.current == Platforms.webAndroid
              ? dataWebAndroid ?? dataWeb ?? dataDefault
              : Platform.current == Platforms.webIOS
              ? dataWebIOS ?? dataWeb ?? dataDefault
              : Platform.current == Platforms.webWindows
              ? dataWebWindows ?? dataWeb ?? dataDefault
              : Platform.current == Platforms.webMacOS
              ? dataWebMacOS ?? dataWeb ?? dataDefault
              : Platform.current == Platforms.webLinux
              ? dataWebLinux ?? dataWeb ?? dataDefault
              : dataWeb ?? dataDefault)
        : dataDefault;
    data = getData is Function ? getData() : getData;
  }
  late final dynamic data;
  Widget get widget =>
      data is Widget ? data as Widget : const SizedBox.shrink();
  PreferredSizeWidget? get preferredSizeWidget =>
      widget is PreferredSizeWidget ? widget as PreferredSizeWidget : null;
}
