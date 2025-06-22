import 'package:cross_platfrom_ui/cross_platform_device_type.dart';
import 'package:cross_platfrom_ui/cross_platform_type.dart';
import 'package:cross_platfrom_ui/cross_platfrom_ui.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Selection {
  static CrossPlatformUi radio<T>({
    CrossPlatformDeviceType? type,
    required T value,
    required T groupValue,
    void Function(T?)? onChanged,
  }) {
    type ??= CrossPlatformDeviceType();
    return type.data({
      CrossPlatformType.material: () =>
          Radio<T>(value: value, groupValue: groupValue, onChanged: onChanged),
      CrossPlatformType.cupertino: () => CupertinoRadio<T>(
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
      ),
      CrossPlatformType.fluent: () => RadioButton(
        checked: groupValue == value,
        onChanged: (changed) {
          if (onChanged != null && changed) {
            onChanged(value);
          }
        },
      ),
    });
  }
}
