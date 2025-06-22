import 'package:cross_platform_ui/cross_platform_device_type.dart';
import 'package:cross_platform_ui/cross_platform_type.dart';
import 'package:cross_platform_ui/cross_platform_ui.dart';
import 'package:flutter/material.dart';

class MaterialItem {
  static CrossPlatformUi tabBar({
    CrossPlatformDeviceType? type,
    required List<Tab> tabs,
    TabController? controller,
    bool isScrollable = false,
    void Function(int)? onTap,
  }) {
    type ??= CrossPlatformDeviceType();
    final tabBarData = TabBar(
      tabs: tabs,
      controller: controller,
      isScrollable: isScrollable,
      onTap: onTap,
    );
    output() => preferredSize(
      child: material(child: tabBarData).widget,
      preferredSize: tabBarData.preferredSize,
    ).widget;
    return type.data({
      CrossPlatformType.material: output,
      CrossPlatformType.cupertino: output,
      CrossPlatformType.fluent: output,
    });
  }

  static CrossPlatformUi material({
    CrossPlatformDeviceType? type,
    Widget? child,
  }) {
    type ??= CrossPlatformDeviceType();
    return type.data({
      CrossPlatformType.material: () => child,
      CrossPlatformType.cupertino: () => Material(child: child),
      CrossPlatformType.fluent: () => Material(child: child),
    });
  }

  static CrossPlatformUi preferredSize({
    CrossPlatformDeviceType? type,
    required Widget child,
    required Size preferredSize,
  }) {
    type ??= CrossPlatformDeviceType();
    return type.data({
      CrossPlatformType.material: () =>
          PreferredSize(preferredSize: preferredSize, child: child),
      CrossPlatformType.cupertino: () => PreferredSize(
        preferredSize: preferredSize,
        child: Material(child: child),
      ),
      CrossPlatformType.fluent: () => PreferredSize(
        preferredSize: preferredSize,
        child: Material(child: child),
      ),
    });
  }
}
