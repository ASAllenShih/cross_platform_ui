import 'package:cross_platfrom_ui/cross_platform_device_type.dart';
import 'package:cross_platfrom_ui/cross_platform_type.dart';
import 'package:cross_platfrom_ui/cross_platfrom_ui.dart';
import 'package:flutter/cupertino.dart';

class Section {
  static CrossPlatformUi list({
    CrossPlatformDeviceType? type,
    Widget? header,
    Widget? footer,
    required List<Widget> children,
  }) {
    type ??= CrossPlatformDeviceType();
    return type.data({
      CrossPlatformType.material: () =>
          _default(header: header, footer: footer, children: children),
      CrossPlatformType.cupertino: () => CupertinoFormSection(
        header: header,
        footer: footer,
        children: children,
      ),
      CrossPlatformType.fluent: () =>
          _default(header: header, footer: footer, children: children),
    });
  }

  static CrossPlatformUi form({
    CrossPlatformDeviceType? type,
    Widget? header,
    Widget? footer,
    required List<Widget> children,
  }) {
    type ??= CrossPlatformDeviceType();
    return type.data({
      CrossPlatformType.material: () =>
          _default(header: header, footer: footer, children: children),
      CrossPlatformType.cupertino: () => CupertinoFormSection(
        header: header,
        footer: footer,
        children: children,
      ),
      CrossPlatformType.fluent: () =>
          _default(header: header, footer: footer, children: children),
    });
  }

  static Widget _default({
    Widget? header,
    Widget? footer,
    required List<Widget> children,
  }) {
    return Column(
      children: [
        if (header != null) Row(children: [header]),
        if (footer != null) Row(children: [footer]),
        ...children,
      ],
    );
  }
}
