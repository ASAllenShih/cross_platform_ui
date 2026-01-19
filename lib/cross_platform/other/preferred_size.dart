import 'package:cross_platform_ui/cross_platform_type.dart';
import 'package:cross_platform_ui/cross_platform_ui.dart';
import 'package:cross_platform_ui/method/method_widget.dart';
import 'package:cross_platform_ui/ui/widget/ui_preferred_size_widget.dart';
import 'package:cross_platform_ui/ui/widget/ui_widget.dart';
import 'package:flutter/widgets.dart';

class CrossPlatformPreferredSize
    extends CrossPlatformUi<CrossPlatformPreferredSize>
    with UiWidget, UiPreferredSizeWidget {
  CrossPlatformPreferredSize({
    required dynamic child,
    required Size preferredSize,
    super.type,
  }) : super(
         datas: {
           CrossPlatformType.all: () => PreferredSize(
             preferredSize: preferredSize,
             child: methodWidget(child),
           ),
         },
       );
}
