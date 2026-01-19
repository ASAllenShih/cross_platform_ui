import 'package:cross_platform_ui/cross_platform_type.dart';
import 'package:cross_platform_ui/cross_platform_ui.dart';
import 'package:cross_platform_ui/method/method_widget.dart';
import 'package:cross_platform_ui/ui/widget/ui_widget.dart';
import 'package:flutter/cupertino.dart';

class CrossPlatformCupertinoActionSheetAction
    extends CrossPlatformUi<CrossPlatformCupertinoActionSheetAction>
    with UiWidget {
  CrossPlatformCupertinoActionSheetAction({
    required void Function() onPressed,
    bool isDefaultAction = false,
    bool isDestructiveAction = false,
    required dynamic child,
    super.type,
  }) : super(
         datas: {
           CrossPlatformType.cupertino: () => CupertinoActionSheetAction(
             onPressed: onPressed,
             isDefaultAction: isDefaultAction,
             isDestructiveAction: isDestructiveAction,
             child: methodWidget(child),
           ),
         },
       );
}
