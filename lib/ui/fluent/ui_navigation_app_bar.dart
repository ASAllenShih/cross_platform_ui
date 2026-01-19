import 'package:cross_platform_ui/ui/ui_data.dart';
import 'package:fluent_ui/fluent_ui.dart';

mixin UiNavigationAppBar implements UiData {
  NavigationAppBar? get navigationAppBar =>
      data is NavigationAppBar ? data as NavigationAppBar : null;
}
