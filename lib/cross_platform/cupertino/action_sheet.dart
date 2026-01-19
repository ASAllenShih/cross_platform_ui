import 'package:cross_platform_ui/cross_platform_type.dart';
import 'package:cross_platform_ui/cross_platform_ui.dart';
import 'package:cross_platform_ui/method/method_widget.dart';
import 'package:cross_platform_ui/ui/widget/ui_widget.dart';
import 'package:flutter/cupertino.dart';

class CrossPlatformCupertinoActionSheet
    extends CrossPlatformUi<CrossPlatformCupertinoActionSheet>
    with UiWidget {
  CrossPlatformCupertinoActionSheet({
    dynamic title,
    dynamic message,
    List<dynamic>? actions,
    dynamic cancelButton,
    super.type,
  }) : super(
         datas: {
           CrossPlatformType.cupertino: () => CupertinoActionSheet(
             title: methodWidgetOrNull(title),
             message: methodWidgetOrNull(message),
             actions: methodWidgetListOrNull(actions),
             cancelButton: methodWidgetOrNull(cancelButton),
           ),
         },
       );
}
