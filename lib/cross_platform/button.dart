import 'package:cross_platform_ui/cross_platform_device_type.dart';
import 'package:cross_platform_ui/cross_platform_type.dart';
import 'package:cross_platform_ui/cross_platform_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material_widgets show FilledButton;
import 'package:fluent_ui/fluent_ui.dart'
    as fluent_widgets
    show Button, FilledButton;

class Button {
  static CrossPlatformUi text({
    CrossPlatformDeviceType? type,
    required void Function()? onPressed,
    void Function()? onLongPress,
    void Function(bool)? onHover,
    void Function(bool)? onFocusChange,
    required Widget child,
  }) {
    type ??= CrossPlatformDeviceType();
    return type.data({
      CrossPlatformType.material: () => TextButton(
        onPressed: onPressed,
        onLongPress: onLongPress,
        onHover: onHover,
        onFocusChange: onFocusChange,
        child: child,
      ),
      CrossPlatformType.cupertino: () => CupertinoButton(
        onPressed: onPressed,
        onLongPress: onLongPress,
        onFocusChange: onFocusChange,
        child: child,
      ),
      CrossPlatformType.fluent: () => fluent_widgets.Button(
        onPressed: onPressed,
        onLongPress: onLongPress,
        child: child,
      ),
    });
  }

  static CrossPlatformUi elevated({
    CrossPlatformDeviceType? type,
    required void Function()? onPressed,
    void Function()? onLongPress,
    void Function(bool)? onHover,
    void Function(bool)? onFocusChange,
    required Widget child,
  }) {
    type ??= CrossPlatformDeviceType();
    return type.data({
      CrossPlatformType.material: () => ElevatedButton(
        onPressed: onPressed,
        onLongPress: onLongPress,
        onHover: onHover,
        onFocusChange: onFocusChange,
        child: child,
      ),
      CrossPlatformType.cupertino: () => CupertinoButton.tinted(
        onPressed: onPressed,
        onLongPress: onLongPress,
        onFocusChange: onFocusChange,
        child: child,
      ),
      CrossPlatformType.fluent: () => fluent_widgets.Button(
        onPressed: onPressed,
        onLongPress: onLongPress,
        child: child,
      ),
    });
  }

  static CrossPlatformUi filled({
    CrossPlatformDeviceType? type,
    required void Function()? onPressed,
    void Function()? onLongPress,
    void Function(bool)? onHover,
    void Function(bool)? onFocusChange,
    required Widget child,
  }) {
    type ??= CrossPlatformDeviceType();
    return type.data({
      CrossPlatformType.material: () => material_widgets.FilledButton(
        onPressed: onPressed,
        onLongPress: onLongPress,
        onHover: onHover,
        onFocusChange: onFocusChange,
        child: child,
      ),
      CrossPlatformType.cupertino: () => CupertinoButton.filled(
        onPressed: onPressed,
        onLongPress: onLongPress,
        onFocusChange: onFocusChange,
        child: child,
      ),
      CrossPlatformType.fluent: () => fluent_widgets.FilledButton(
        onPressed: onPressed,
        onLongPress: onLongPress,
        child: child,
      ),
    });
  }

  static CrossPlatformUi dialog({
    CrossPlatformDeviceType? type,
    required void Function()? onPressed,
    void Function()? onLongPress,
    void Function(bool)? onHover,
    void Function(bool)? onFocusChange,
    required Widget child,
    bool isDefaultAction = false,
  }) {
    type ??= CrossPlatformDeviceType();
    return type.data({
      CrossPlatformType.material: () => TextButton(
        onPressed: onPressed,
        onLongPress: onLongPress,
        onHover: onHover,
        onFocusChange: onFocusChange,
        autofocus: isDefaultAction,
        child: child,
      ),
      CrossPlatformType.cupertino: () => CupertinoDialogAction(
        onPressed: onPressed,
        isDefaultAction: isDefaultAction,
        child: child,
      ),
      CrossPlatformType.fluent: () => isDefaultAction
          ? filled(
              type: type,
              onPressed: onPressed,
              onLongPress: onLongPress,
              onHover: onHover,
              onFocusChange: onFocusChange,
              child: child,
            ).widget
          : elevated(
              type: type,
              onPressed: onPressed,
              onLongPress: onLongPress,
              onHover: onHover,
              onFocusChange: onFocusChange,
              child: child,
            ).widget,
    });
  }
}
