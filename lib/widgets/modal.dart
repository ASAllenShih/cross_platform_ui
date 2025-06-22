import 'package:cross_platfrom_ui/cross_platform_device_type.dart';
import 'package:cross_platfrom_ui/cross_platform_type.dart';
import 'package:cross_platfrom_ui/cross_platfrom_ui.dart';
import 'package:flutter/cupertino.dart';

class Modal {
  static Future<T?> showPopup<T>({
    CrossPlatformDeviceType? type,
    required BuildContext context,
    required Widget Function(BuildContext) builder,
    bool? barrierDismissible,
  }) {
    type ??= CrossPlatformDeviceType(main: CrossPlatformType.cupertino);
    return type.data({
      CrossPlatformType.cupertino: () => showCupertinoModalPopup<T>(
        context: context,
        builder: builder,
        barrierDismissible: barrierDismissible ?? true,
      ),
    }).data;
  }

  static CrossPlatformUi actionSheet({
    CrossPlatformDeviceType? type,
    Widget? title,
    Widget? message,
    List<Widget>? actions,
    Widget? cancelButton,
  }) {
    type ??= CrossPlatformDeviceType(main: CrossPlatformType.cupertino);
    return type.data({
      CrossPlatformType.cupertino: () => CupertinoActionSheet(
        title: title,
        message: message,
        actions: actions,
      ),
    });
  }

  static CrossPlatformUi actionSheetAction({
    CrossPlatformDeviceType? type,
    required void Function() onPressed,
    bool isDefaultAction = false,
    bool isDestructiveAction = false,
    required Widget child,
  }) {
    type ??= CrossPlatformDeviceType(main: CrossPlatformType.cupertino);
    return type.data({
      CrossPlatformType.cupertino: () => CupertinoActionSheetAction(
        onPressed: onPressed,
        isDefaultAction: isDefaultAction,
        isDestructiveAction: isDestructiveAction,
        child: child,
      ),
    });
  }
}
