import 'package:cross_platform_ui/cross_platform_type.dart';
import 'package:cross_platform_ui/cross_platform_ui.dart';
import 'package:cross_platform_ui/method/method_preferred_size_widget.dart';
import 'package:cross_platform_ui/method/method_widget.dart';
import 'package:cross_platform_ui/ui/fluent/ui_navigation_app_bar.dart';
import 'package:cross_platform_ui/ui/cupertino/ui_obstructing_preferred_size_widget.dart';
import 'package:cross_platform_ui/ui/widget/ui_preferred_size_widget.dart';
import 'package:cross_platform_ui/ui/widget/ui_widget.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CrossPlatformAppBar extends CrossPlatformUi<CrossPlatformAppBar>
    with
        UiNavigationAppBar,
        UiObstructingPreferredSizeWidget,
        UiPreferredSizeWidget,
        UiWidget {
  CrossPlatformAppBar({
    BuildContext? context,
    dynamic leading,
    dynamic title,
    List<dynamic>? actions,
    dynamic bottom,
    String? previousPageTitle,
    super.type,
  }) : super(
         datas: {
           CrossPlatformType.material: () => AppBar(
             leading: methodWidgetOrNull(leading),
             title: methodWidgetOrNull(title),
             actions: methodWidgetListOrNull(actions),
             bottom: methodPreferredSizeWidget(bottom),
             backgroundColor: context != null
                 ? Theme.of(context).colorScheme.inversePrimary
                 : null,
           ),
           CrossPlatformType.cupertino: () => CupertinoNavigationBar(
             leading: methodWidgetOrNull(leading),
             middle: methodWidgetOrNull(title),
             trailing: methodWidgetListOrNull(actions) != null
                 ? Flex(
                     direction: Axis.horizontal,
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     clipBehavior: Clip.antiAliasWithSaveLayer,
                     children: [
                       SizedBox.shrink(),
                       if (methodWidgetOrNull(title) != null)
                         Flexible(child: methodWidget(title)),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.end,
                         mainAxisSize: MainAxisSize.min,
                         children: methodWidgetList(actions),
                       ),
                     ],
                   )
                 : null,
             bottom: methodPreferredSizeWidget(bottom),
             previousPageTitle: previousPageTitle,
             automaticBackgroundVisibility: false,
             enableBackgroundFilterBlur: false,
           ),
           CrossPlatformType.fluent: () => NavigationAppBar(
             leading: methodWidgetOrNull(leading),
             title: methodWidgetOrNull(bottom) != null
                 ? Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       if (methodWidgetOrNull(title) != null)
                         methodWidget(title),
                       methodWidget(bottom),
                     ],
                   )
                 : title,
             actions: methodWidgetListOrNull(actions) != null
                 ? Wrap(children: methodWidgetList(actions))
                 : null,
             height: 50.0 + (bottom?.preferredSize.height ?? 0.0),
           ),
         },
       );
}
