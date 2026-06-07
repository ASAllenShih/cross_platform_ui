import 'dart:async';

import 'package:cross_platform_ui/cross_platform_type.dart';
import 'package:cross_platform_ui/cross_platform_ui.dart';
import 'package:cross_platform_ui/method/method_widget.dart';
import 'package:cross_platform_ui/ui/widget/ui_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CrossPlatformListTile extends CrossPlatformUi<CrossPlatformListTile>
    with UiWidget {
  CrossPlatformListTile({
    dynamic title,
    dynamic subtitle,
    dynamic leading,
    dynamic trailing,
    bool cupertinoTrailingWidget = false,
    Color? iconColor,
    FutureOr<void> Function()? onTap,
    FutureOr<void> Function()? onLongPress,
    super.type,
  }) : super(
         datas: {
           CrossPlatformType.material: () => ListTile(
             title: methodWidgetOrNull(title),
             subtitle: methodWidgetOrNull(subtitle),
             leading: methodWidgetOrNull(leading),
             trailing: methodWidgetOrNull(trailing),
             iconColor: iconColor,
             onTap: onTap,
             onLongPress: onLongPress,
           ),
           CrossPlatformType.cupertino: () => CupertinoListTile(
             title: methodWidget(title),
             subtitle: methodWidgetOrNull(subtitle),
             leading: methodWidgetOrNull(leading) != null
                 ? Container(color: iconColor, child: methodWidget(leading))
                 : null,
             trailing: (cupertinoTrailingWidget == false)
                 ? trailing
                 : methodWidgetOrNull(trailing) != null
                 ? Row(
                     mainAxisSize: MainAxisSize.min,
                     children: [
                       methodWidget(trailing),
                       const CupertinoListTileChevron(),
                     ],
                   )
                 : const CupertinoListTileChevron(),
             onTap: onTap ?? onLongPress,
           ),
         },
       );
}
