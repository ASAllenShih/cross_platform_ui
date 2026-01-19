import 'package:cross_platform_ui/ui/cupertino/ui_obstructing_preferred_size_widget.dart';
import 'package:flutter/cupertino.dart';

ObstructingPreferredSizeWidget? methodObstructingPreferredSizeWidget(
  dynamic data,
) => data is UiObstructingPreferredSizeWidget
    ? data.obstructingPreferredSizeWidget
    : data is ObstructingPreferredSizeWidget
    ? data
    : null;
