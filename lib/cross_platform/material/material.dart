import 'package:cross_platform_ui/cross_platform_type.dart';
import 'package:cross_platform_ui/cross_platform_ui.dart';
import 'package:cross_platform_ui/method/method_widget.dart';
import 'package:cross_platform_ui/ui/widget/ui_widget.dart';
import 'package:flutter/material.dart';

class CrossPlatformMaterial extends CrossPlatformUi<CrossPlatformMaterial>
    with UiWidget {
  CrossPlatformMaterial({dynamic child, super.type})
    : super(
        datas: {
          CrossPlatformType.all: () =>
              Material(child: methodWidgetOrNull(child)),
          CrossPlatformType.material: () => methodWidgetOrNull(child),
        },
      );
}
