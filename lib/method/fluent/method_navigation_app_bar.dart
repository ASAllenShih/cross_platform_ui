import 'package:cross_platform_ui/ui/fluent/ui_navigation_app_bar.dart';
import 'package:fluent_ui/fluent_ui.dart';

NavigationAppBar? methodNavigationAppBar(dynamic data) =>
    data is UiNavigationAppBar
    ? data.navigationAppBar
    : data is NavigationAppBar
    ? data
    : null;
