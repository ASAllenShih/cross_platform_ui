import 'package:cross_platform_ui/cross_platform_type.dart';
import 'package:cross_platform_ui/cross_platform_ui.dart';
import 'package:cross_platform_ui/ui/widget/ui_widget.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CrossPlatformProgressIndicator
    extends CrossPlatformUi<CrossPlatformProgressIndicator>
    with UiWidget {
  CrossPlatformProgressIndicator({super.type})
    : super(
        datas: {
          CrossPlatformType.material: () => CircularProgressIndicator(),
          CrossPlatformType.cupertino: () => CupertinoActivityIndicator(),
          CrossPlatformType.fluent: () => ProgressRing(),
        },
      );
}
