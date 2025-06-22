import 'package:cross_platform_ui/cross_platform_device_type.dart';
import 'package:cross_platform_ui/cross_platform_type.dart';
import 'package:cross_platform_ui/cross_platform_ui.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent_widgets show ListTile;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as material_widgets show ListTile;

class Tile {
  static CrossPlatformUi list({
    CrossPlatformDeviceType? type,
    Widget? title,
    Widget? subtitle,
    Widget? leading,
    Widget? trailing,
    bool cupertinoTrailingWidget = false,
    Color? iconColor,
    void Function()? onTap,
    void Function()? onLongPress,
  }) {
    type ??= CrossPlatformDeviceType();
    return type.data({
      CrossPlatformType.material: () => material_widgets.ListTile(
        title: title,
        subtitle: subtitle,
        leading: leading,
        trailing: trailing,
        iconColor: iconColor,
        onTap: onTap,
        onLongPress: onLongPress,
      ),
      CrossPlatformType.cupertino: () => CupertinoListTile(
        title: title ?? const SizedBox.shrink(),
        subtitle: subtitle,
        leading: leading != null
            ? Container(color: iconColor, child: leading)
            : null,
        trailing: (cupertinoTrailingWidget == false)
            ? trailing
            : trailing != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [trailing, const CupertinoListTileChevron()],
              )
            : const CupertinoListTileChevron(),
        onTap: () {
          if (onTap is Function) {
            onTap!();
          } else if (onLongPress is Function) {
            onLongPress!();
          }
        },
      ),
      CrossPlatformType.fluent: () => fluent_widgets.ListTile(
        title: title,
        subtitle: subtitle,
        leading: leading != null
            ? Container(color: iconColor, child: leading)
            : null,
        trailing: trailing,
        onPressed: () {
          if (onTap is Function) {
            onTap!();
          } else if (onLongPress is Function) {
            onLongPress!();
          }
        },
      ),
    });
  }
}
