import 'package:cross_platform_ui/cross_platform_type.dart';
import 'package:cross_platform_ui/cross_platform_ui.dart';
import 'package:cross_platform_ui/ui/widget/ui_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CrossPlatformRadio<T> extends CrossPlatformUi<CrossPlatformRadio<T>>
    with UiWidget {
  CrossPlatformRadio({required T value, super.type})
    : super(
        datas: {
          CrossPlatformType.material: () => Radio<T>(value: value),
          CrossPlatformType.cupertino: () => CupertinoRadio<T>(value: value),
          CrossPlatformType.fluent: () => Radio<T>(value: value),
        },
      );
}
