import 'package:cross_platform_ui/ui/widget/ui_widget.dart';
import 'package:flutter/widgets.dart';

Widget? methodWidgetOrNull(dynamic data) => data is UiWidget
    ? data.widgetOrNull
    : data is Widget
    ? data
    : null;

Widget methodWidget(dynamic data) => data is UiWidget
    ? data.widget
    : data is Widget
    ? data
    : const SizedBox.shrink();

List<Widget> methodWidgetList(List<dynamic>? datas) =>
    datas
        ?.map((data) => methodWidgetOrNull(data))
        .whereType<Widget>()
        .toList() ??
    [];
List<Widget>? methodWidgetListOrNull(List<dynamic>? datas) {
  final List<Widget> list = methodWidgetList(datas);
  return list.isEmpty ? null : list;
}
