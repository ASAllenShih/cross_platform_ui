import 'package:cross_platform_ui/cross_platform_type.dart';
import 'package:cross_platform_ui/cross_platform_ui.dart';
import 'package:cross_platform_ui/ui/widget/ui_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CrossPlatformAppRouter extends CrossPlatformUi<CrossPlatformAppRouter>
    with UiWidget {
  CrossPlatformAppRouter({
    String? title,
    Iterable<Locale>? supportedLocales,
    Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates,
    ThemeMode? themeMode,
    BuildContext? context,
    ColorScheme? lightColorScheme,
    ColorScheme? darkColorScheme,
    RouterConfig<Object>? router,
    super.type,
  }) : super(
         datas: {
           CrossPlatformType.material: () => MaterialApp.router(
             title: title,
             theme: ThemeData(
               colorScheme: lightColorScheme,
               useMaterial3: true,
             ),
             darkTheme: ThemeData(
               colorScheme: darkColorScheme,
               useMaterial3: true,
             ),
             supportedLocales:
                 supportedLocales ?? const <Locale>[Locale('en', 'US')],
             localizationsDelegates: localizationsDelegates,
             routerConfig: router,
           ),
           CrossPlatformType.cupertino: () {
             final ThemeData materialTheme = ThemeData(
               colorScheme: (themeMode == ThemeMode.dark
                   ? (darkColorScheme ?? lightColorScheme)
                   : themeMode == ThemeMode.light
                   ? lightColorScheme
                   : context != null
                   ? MediaQuery.platformBrightnessOf(context) == Brightness.dark
                         ? (darkColorScheme ?? lightColorScheme)
                         : lightColorScheme
                   : null),
               brightness: themeMode == ThemeMode.dark
                   ? Brightness.dark
                   : themeMode == ThemeMode.light
                   ? Brightness.light
                   : context != null
                   ? MediaQuery.platformBrightnessOf(context)
                   : Brightness.light,
               useMaterial3: true,
             );
             return CupertinoApp.router(
               title: title,
               theme:
                   MaterialBasedCupertinoThemeData(
                     materialTheme: materialTheme,
                   ).copyWith(
                     primaryColor: materialTheme.colorScheme.primary,
                     primaryContrastingColor:
                         materialTheme.colorScheme.onPrimary,
                     textTheme: CupertinoTextThemeData(
                       primaryColor: materialTheme.colorScheme.primary,
                       navActionTextStyle: materialTheme.tabBarTheme.labelStyle,
                     ),
                     barBackgroundColor:
                         materialTheme.brightness == Brightness.light
                         ? null
                         : Colors.black,
                   ),
               supportedLocales:
                   supportedLocales ?? const <Locale>[Locale('en', 'US')],
               localizationsDelegates: localizationsDelegates,
               routerConfig: router,
             );
           },
         },
       );
}
