import 'package:cross_platform_ui/ui/ui_data.dart';
import 'package:flutter/widgets.dart';

mixin UiWidget implements UiData {
  Widget? get widgetOrNull => data is Widget ? data as Widget : null;

  Widget get widget => widgetOrNull ?? const SizedBox.shrink();
}
