import 'package:cross_platform_ui/cross_platform_type.dart';
import 'package:cross_platform_ui/cross_platform_ui.dart';
import 'package:cross_platform_ui/method/method_widget.dart';
import 'package:cross_platform_ui/ui/widget/ui_widget.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CrossPlatformDialogAlert extends CrossPlatformUi<CrossPlatformDialogAlert>
    with UiWidget {
  CrossPlatformDialogAlert({
    dynamic icon,
    dynamic title,
    dynamic content,
    List<dynamic>? actions,
    bool scrollable = false,
    super.type,
  }) : super(
         datas: {
           CrossPlatformType.material: () => AlertDialog(
             icon: methodWidgetOrNull(icon),
             title: methodWidgetOrNull(title),
             content: methodWidgetOrNull(content),
             actions: methodWidgetListOrNull(actions),
             scrollable: scrollable,
           ),
           CrossPlatformType.cupertino: () => CupertinoAlertDialog(
             title: methodWidgetOrNull(title),
             content: methodWidgetOrNull(content),
             actions: methodWidgetList(actions),
           ),
           CrossPlatformType.fluent: () => ContentDialog(
             title: methodWidgetOrNull(title),
             content: methodWidgetOrNull(content),
             actions: methodWidgetListOrNull(actions),
           ),
         },
       );
}
