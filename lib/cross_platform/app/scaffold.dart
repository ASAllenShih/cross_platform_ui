import 'package:cross_platform_ui/cross_platform_type.dart';
import 'package:cross_platform_ui/cross_platform_ui.dart';
import 'package:cross_platform_ui/method/cupertino/method_obstructing_preferred_size_widget.dart';
import 'package:cross_platform_ui/method/fluent/method_navigation_app_bar.dart';
import 'package:cross_platform_ui/method/method_preferred_size_widget.dart';
import 'package:cross_platform_ui/method/method_widget.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CrossPlatformAppScaffold
    extends CrossPlatformUi<CrossPlatformAppScaffold> {
  CrossPlatformAppScaffold({
    dynamic appBar,
    dynamic body,
    dynamic bottomSheet,
    dynamic floatingActionButton,
    FloatingActionButtonLocation? floatingActionButtonLocation,
    super.type,
  }) : super(
         datas: {
           CrossPlatformType.material: () => Scaffold(
             body: methodWidgetOrNull(body) != null
                 ? SafeArea(child: methodWidget(body))
                 : null,
             appBar: methodPreferredSizeWidget(appBar),
             floatingActionButton: methodWidgetOrNull(floatingActionButton),
             floatingActionButtonLocation: floatingActionButtonLocation,
             bottomSheet: methodWidgetOrNull(bottomSheet),
           ),
           CrossPlatformType.cupertino: () => CupertinoPageScaffold(
             navigationBar: methodObstructingPreferredSizeWidget(appBar),
             resizeToAvoidBottomInset: true,
             child: SafeArea(
               child: Flex(
                 direction: Axis.vertical,
                 children: [
                   if (methodWidgetOrNull(body) != null)
                     Flexible(child: methodWidget(body)),
                   if (methodWidgetOrNull(floatingActionButton) != null)
                     Row(
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: [methodWidget(floatingActionButton)],
                     ),
                   if (methodWidgetOrNull(bottomSheet) != null)
                     methodWidget(bottomSheet),
                 ],
               ),
             ),
           ),
           CrossPlatformType.fluent: () => NavigationView(
             content: SafeArea(
               child: Flex(
                 direction: Axis.vertical,
                 children: [
                   if (methodWidgetOrNull(body) != null)
                     Flexible(child: methodWidget(body)),
                   if (methodWidgetOrNull(floatingActionButton) != null)
                     Row(
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: [methodWidget(floatingActionButton)],
                     ),
                   if (methodWidgetOrNull(bottomSheet) != null)
                     methodWidget(bottomSheet),
                 ],
               ),
             ),
             appBar: methodNavigationAppBar(appBar),
           ),
         },
       );
}
