import 'package:cross_platform_ui/cross_platform_type.dart';
import 'package:cross_platform_ui/cross_platform_ui.dart';
import 'package:cross_platform_ui/method/method_widget.dart';
import 'package:cross_platform_ui/ui/widget/ui_widget.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CrossPlatformButtonElevated
    extends CrossPlatformUi<CrossPlatformButtonElevated>
    with UiWidget {
  CrossPlatformButtonElevated({
    required void Function()? onPressed,
    void Function()? onLongPress,
    void Function(bool)? onHover,
    void Function(bool)? onFocusChange,
    required dynamic child,
    super.type,
  }) : super(
         datas: {
           CrossPlatformType.material: () => ElevatedButton(
             onPressed: onPressed,
             onLongPress: onLongPress,
             onHover: onHover,
             onFocusChange: onFocusChange,
             child: methodWidget(child),
           ),
           CrossPlatformType.cupertino: () => CupertinoButton.tinted(
             onPressed: onPressed,
             onLongPress: onLongPress,
             onFocusChange: onFocusChange,
             child: methodWidget(child),
           ),
           CrossPlatformType.fluent: () => Button(
             onPressed: onPressed,
             onLongPress: onLongPress,
             child: methodWidget(child),
           ),
         },
       );
}
