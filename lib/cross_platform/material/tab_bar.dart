import 'package:cross_platform_ui/cross_platform/material.dart';
import 'package:cross_platform_ui/cross_platform/other.dart';
import 'package:cross_platform_ui/cross_platform_type.dart';
import 'package:cross_platform_ui/cross_platform_ui.dart';
import 'package:cross_platform_ui/ui/widget/ui_preferred_size_widget.dart';
import 'package:cross_platform_ui/ui/widget/ui_widget.dart';
import 'package:flutter/material.dart';

class CrossPlatformTabBar extends CrossPlatformUi<CrossPlatformTabBar>
    with UiWidget, UiPreferredSizeWidget {
  CrossPlatformTabBar({
    required List<Tab> tabs,
    TabController? controller,
    bool isScrollable = false,
    void Function(int)? onTap,
    super.type,
  }) : super(
         datas: {
           CrossPlatformType.all: () {
             final tabBar = TabBar(
               tabs: tabs,
               controller: controller,
               isScrollable: isScrollable,
               onTap: onTap,
             );
             return CrossPlatformPreferredSize(
               child: CrossPlatformMaterial(child: tabBar, type: type),
               preferredSize: tabBar.preferredSize,
             ).preferredSizeWidget;
           },
         },
       );
}
