import 'package:cross_platform_ui/cross_platform_device_type.dart';
import 'package:cross_platform_ui/cross_platform_type.dart';
import 'package:cross_platform_ui/cross_platform_ui.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as material_widgets show showDialog;
import 'package:fluent_ui/fluent_ui.dart' as fluent_widgets show showDialog;
import 'package:flutter/material.dart';

class Dialog {
  static Future<T?> show<T>({
    CrossPlatformDeviceType? type,
    required BuildContext context,
    required Widget Function(BuildContext) builder,
    bool? barrierDismissible,
  }) {
    type ??= CrossPlatformDeviceType();
    return type.data(<CrossPlatformType, dynamic Function()>{
          CrossPlatformType.material: () => material_widgets.showDialog<T>(
            context: context,
            builder: builder,
            barrierDismissible: barrierDismissible ?? false,
          ),
          CrossPlatformType.cupertino: () => showCupertinoDialog<T>(
            context: context,
            builder: builder,
            barrierDismissible: barrierDismissible ?? false,
          ),
          CrossPlatformType.fluent: () => fluent_widgets.showDialog<T>(
            context: context,
            builder: builder,
            barrierDismissible: barrierDismissible ?? false,
          ),
        }).data
        as Future<T?>;
  }
  static CrossPlatformUi alert({
    CrossPlatformDeviceType? type,
    Widget? icon,
    Widget? title,
    Widget? content,
    List<Widget>? actions,
    bool scrollable = false,
  }) {
    type ??= CrossPlatformDeviceType();
    return type.data(<CrossPlatformType, dynamic Function()>{
      CrossPlatformType.material: () => AlertDialog(
        icon: icon,
        title: title,
        content: content,
        actions: actions,
        scrollable: scrollable,
      ),
      CrossPlatformType.cupertino: () => CupertinoAlertDialog(
        title: title,
        content: content,
        actions: actions ?? <Widget>[],
      ),
      CrossPlatformType.fluent: () => ContentDialog(
        title: title,
        content: content,
        actions: actions,
      ),
    });
  }
}
