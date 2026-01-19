import 'package:cross_platform_ui/ui/widget/ui_preferred_size_widget.dart';
import 'package:flutter/cupertino.dart';

mixin UiObstructingPreferredSizeWidget implements UiPreferredSizeWidget {
  ObstructingPreferredSizeWidget? get obstructingPreferredSizeWidget =>
      preferredSizeWidget is ObstructingPreferredSizeWidget
      ? preferredSizeWidget as ObstructingPreferredSizeWidget
      : null;
}
