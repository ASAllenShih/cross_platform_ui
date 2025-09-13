import 'package:asallenshih_flutter_util/device_platform.dart';
import 'package:flutter/widgets.dart';

dynamic _dataGet(
  DevicePlatform currentPlatform,
  dynamic defaultData,
  dynamic platformData,
  dynamic platformWebData,
) {
  if (currentPlatform.isWeb) {
    return platformWebData ?? platformData ?? defaultData;
  }
  return platformData ?? defaultData;
}

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
    final DevicePlatform platform = DevicePlatform.current;
    final dynamic getData = switch (platform.system) {
      DevicePlatform.android => _dataGet(
        platform,
        dataDefault,
        dataAndroid,
        dataWebAndroid,
      ),
      DevicePlatform.ios => _dataGet(
        platform,
        dataDefault,
        dataIOS,
        dataWebIOS,
      ),
      DevicePlatform.windows => _dataGet(
        platform,
        dataDefault,
        dataWindows,
        dataWebWindows,
      ),
      DevicePlatform.macOS => _dataGet(
        platform,
        dataDefault,
        dataMacOS,
        dataWebMacOS,
      ),
      DevicePlatform.linux => _dataGet(
        platform,
        dataDefault,
        dataLinux,
        dataWebLinux,
      ),
      DevicePlatform.web => _dataGet(platform, dataDefault, dataWeb, null),
      _ => dataDefault,
    };
    data = getData is Function ? getData() : getData;
  }
  late final dynamic data;
  Widget get widget =>
      data is Widget ? data as Widget : const SizedBox.shrink();
  PreferredSizeWidget? get preferredSizeWidget =>
      widget is PreferredSizeWidget ? widget as PreferredSizeWidget : null;
}
