import 'package:cross_platform_ui/ui/widget/ui_widget.dart';
import 'package:flutter/widgets.dart';

mixin UiPreferredSizeWidget implements UiWidget {
  PreferredSizeWidget? get preferredSizeWidget =>
      widget is PreferredSizeWidget ? widget as PreferredSizeWidget : null;
}
