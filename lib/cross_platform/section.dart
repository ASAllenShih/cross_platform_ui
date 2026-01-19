import 'package:cross_platform_ui/cross_platform_type.dart';
import 'package:cross_platform_ui/cross_platform_ui.dart';
import 'package:cross_platform_ui/method/method_widget.dart';
import 'package:cross_platform_ui/ui/widget/ui_widget.dart';
import 'package:flutter/cupertino.dart';

class CrossPlatformSection extends CrossPlatformUi<CrossPlatformSection>
    with UiWidget {
  CrossPlatformSection({
    dynamic header,
    dynamic footer,
    required List<dynamic> children,
  }) : super(
         datas: {
           CrossPlatformType.all: () => Column(
             children: [
               if (methodWidgetOrNull(header) != null)
                 Row(children: [methodWidget(header)]),
               ...children,
               if (methodWidgetOrNull(footer) != null)
                 Row(children: [methodWidget(footer)]),
             ],
           ),
           CrossPlatformType.cupertino: () => CupertinoFormSection(
             header: methodWidgetOrNull(header),
             footer: methodWidgetOrNull(footer),
             children: methodWidgetList(children),
           ),
         },
       );
}
