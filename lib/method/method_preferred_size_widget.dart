import 'package:cross_platform_ui/ui/widget/ui_preferred_size_widget.dart';
import 'package:flutter/widgets.dart';

PreferredSizeWidget? methodPreferredSizeWidget(dynamic data) =>
    data is UiPreferredSizeWidget
    ? data.preferredSizeWidget
    : data is PreferredSizeWidget
    ? data
    : null;
