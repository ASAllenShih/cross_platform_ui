import 'package:cross_platform_ui/cross_platform_device_type.dart';
import 'package:cross_platform_ui/cross_platform_type.dart';
import 'package:cross_platform_ui/cross_platform_ui.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material_widgets show Colors;

class App {
  static CrossPlatformUi router({
    CrossPlatformDeviceType? type,
    String? title,
    Iterable<Locale>? supportedLocales,
    Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates,
    ThemeMode? themeMode,
    BuildContext? context,
    ColorScheme? lightColorScheme,
    ColorScheme? darkColorScheme,
    RouterConfig<Object>? router,
  }) {
    type ??= CrossPlatformDeviceType();
    return type.data({
      CrossPlatformType.material: () => MaterialApp.router(
        title: title,
        theme: ThemeData(colorScheme: lightColorScheme, useMaterial3: true),
        darkTheme: ThemeData(colorScheme: darkColorScheme, useMaterial3: true),
        themeMode: themeMode ?? ThemeMode.system,
        supportedLocales:
            supportedLocales ?? const <Locale>[Locale('en', 'US')],
        localizationsDelegates: localizationsDelegates,
        routerConfig: router,
      ),
      CrossPlatformType.cupertino: () => CupertinoApp.router(
        title: title,
        theme: MaterialBasedCupertinoThemeData(
          materialTheme: ThemeData(
            colorScheme: (themeMode == ThemeMode.dark
                ? (darkColorScheme?.copyWith(brightness: Brightness.dark) ??
                      lightColorScheme)
                : themeMode == ThemeMode.light
                ? lightColorScheme
                : context != null
                ? MediaQuery.platformBrightnessOf(context) == Brightness.dark
                      ? (darkColorScheme?.copyWith(
                              brightness: Brightness.dark,
                            ) ??
                            lightColorScheme)
                      : lightColorScheme
                : null),
            useMaterial3: true,
          ),
        ),
        supportedLocales:
            supportedLocales ?? const <Locale>[Locale('en', 'US')],
        localizationsDelegates: localizationsDelegates,
        routerConfig: router,
      ),
      CrossPlatformType.fluent: () => FluentApp.router(
        title: title ?? '',
        theme: FluentThemeData(brightness: Brightness.light),
        darkTheme: FluentThemeData(brightness: Brightness.dark),
        themeMode: themeMode,
        supportedLocales:
            supportedLocales ?? const <Locale>[Locale('en', 'US')],
        localizationsDelegates: localizationsDelegates,
        routerConfig: router,
      ),
    });
  }

  static CrossPlatformUi scaffold({
    CrossPlatformDeviceType? type,
    dynamic appBar,
    Widget? body,
    Widget? bottomSheet,
    Widget? floatingActionButton,
    FloatingActionButtonLocation? floatingActionButtonLocation,
  }) {
    type ??= CrossPlatformDeviceType();
    return type.data({
      CrossPlatformType.material: () => Scaffold(
        body: body,
        appBar: appBar is PreferredSizeWidget ? appBar : null,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        bottomSheet: bottomSheet,
      ),
      CrossPlatformType.cupertino: () => CupertinoPageScaffold(
        navigationBar: appBar is CupertinoNavigationBar ? appBar : null,
        resizeToAvoidBottomInset: true,
        child: Flex(
          direction: Axis.vertical,
          children: [
            if (body != null) Flexible(child: body),
            if (floatingActionButton != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [floatingActionButton],
              ),
            if (bottomSheet != null) bottomSheet,
          ],
        ),
      ),
      CrossPlatformType.fluent: () => NavigationView(
        content: Flex(
          direction: Axis.vertical,
          children: [
            if (body != null) Flexible(child: body),
            if (floatingActionButton != null) floatingActionButton,
            if (bottomSheet != null) bottomSheet,
          ],
        ),
        appBar: appBar is NavigationAppBar ? appBar : null,
      ),
    });
  }

  static CrossPlatformUi bar({
    CrossPlatformDeviceType? type,
    BuildContext? context,
    Widget? leading,
    Widget? title,
    List<Widget>? actions,
    PreferredSizeWidget? bottom,
    String? previousPageTitle,
  }) {
    type ??= CrossPlatformDeviceType();
    return type.data({
      CrossPlatformType.material: () => AppBar(
        leading: leading,
        title: title,
        actions: actions,
        bottom: bottom,
        backgroundColor: context != null
            ? Theme.of(context).colorScheme.inversePrimary
            : null,
      ),
      CrossPlatformType.cupertino: () => CupertinoNavigationBar(
        leading: leading,
        middle: title,
        trailing: actions != null
            ? Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                children: [
                  SizedBox.shrink(),
                  if (title != null) Flexible(child: title),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: actions,
                  ),
                ],
              )
            : null,
        bottom: bottom,
        previousPageTitle: previousPageTitle,
        backgroundColor:
            (context != null
                    ? CupertinoTheme.of(context).barBackgroundColor
                    : material_widgets.Colors.white)
                .withAlpha(255),
      ),
      CrossPlatformType.fluent: () => NavigationAppBar(
        leading: bottom != null
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [leading ?? SizedBox.shrink(), bottom],
              )
            : null,
        title: title,
        actions: actions != null ? Wrap(children: actions) : null,
      ),
    });
  }
}
