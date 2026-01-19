import 'package:cross_platform_ui/cross_platform/button/elevated.dart';
import 'package:cross_platform_ui/cross_platform/button/filled.dart';
import 'package:cross_platform_ui/cross_platform_type.dart';
import 'package:cross_platform_ui/cross_platform_ui.dart';
import 'package:cross_platform_ui/method/method_widget.dart';
import 'package:cross_platform_ui/ui/widget/ui_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CrossPlatformButtonDialog
    extends CrossPlatformUi<CrossPlatformButtonDialog>
    with UiWidget {
  CrossPlatformButtonDialog({
    required void Function()? onPressed,
    void Function()? onLongPress,
    void Function(bool)? onHover,
    void Function(bool)? onFocusChange,
    required dynamic child,
    bool isDefaultAction = false,
    super.type,
  }) : super(
         datas: {
           CrossPlatformType.material: () => TextButton(
             onPressed: onPressed,
             onLongPress: onLongPress,
             onHover: onHover,
             onFocusChange: onFocusChange,
             autofocus: isDefaultAction,
             child: methodWidget(child),
           ),
           CrossPlatformType.cupertino: () => CupertinoDialogAction(
             onPressed: onPressed,
             isDefaultAction: isDefaultAction,
             child: methodWidget(child),
           ),
           CrossPlatformType.fluent: () => isDefaultAction
               ? CrossPlatformButtonFilled(
                   onPressed: onPressed,
                   onLongPress: onLongPress,
                   onHover: onHover,
                   onFocusChange: onFocusChange,
                   child: child,
                   type: type,
                 ).widget
               : CrossPlatformButtonElevated(
                   onPressed: onPressed,
                   onLongPress: onLongPress,
                   onHover: onHover,
                   onFocusChange: onFocusChange,
                   child: child,
                   type: type,
                 ).widget,
         },
       );
}
