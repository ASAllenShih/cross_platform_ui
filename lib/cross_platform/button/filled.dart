import 'package:cross_platform_ui/cross_platform_type.dart';
import 'package:cross_platform_ui/cross_platform_ui.dart';
import 'package:cross_platform_ui/method/method_widget.dart';
import 'package:cross_platform_ui/ui/widget/ui_widget.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as material;

class CrossPlatformButtonFilled
    extends CrossPlatformUi<CrossPlatformButtonFilled>
    with UiWidget {
  CrossPlatformButtonFilled({
    required void Function()? onPressed,
    void Function()? onLongPress,
    void Function(bool)? onHover,
    void Function(bool)? onFocusChange,
    required dynamic child,
    super.type,
  }) : super(
         datas: {
           CrossPlatformType.material: () => material.FilledButton(
             onPressed: onPressed,
             onLongPress: onLongPress,
             onHover: onHover,
             onFocusChange: onFocusChange,
             child: methodWidget(child),
           ),
           CrossPlatformType.cupertino: () => CupertinoButton.filled(
             onPressed: onPressed,
             onLongPress: onLongPress,
             onFocusChange: onFocusChange,
             child: methodWidget(child),
           ),
           CrossPlatformType.fluent: () => fluent.FilledButton(
             onPressed: onPressed,
             onLongPress: onLongPress,
             child: methodWidget(child),
           ),
         },
       );
}
