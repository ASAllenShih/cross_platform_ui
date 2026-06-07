import 'package:cross_platform_ui/cross_platform_type.dart';
import 'package:cross_platform_ui/cross_platform_ui.dart';
import 'package:cross_platform_ui/method/method_preferred_size_widget.dart';
import 'package:cross_platform_ui/method/method_widget.dart';
import 'package:cross_platform_ui/ui/cupertino/ui_obstructing_preferred_size_widget.dart';
import 'package:cross_platform_ui/ui/widget/ui_preferred_size_widget.dart';
import 'package:cross_platform_ui/ui/widget/ui_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CrossPlatformAppBar extends CrossPlatformUi<CrossPlatformAppBar>
    with
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
         },
       );
}
