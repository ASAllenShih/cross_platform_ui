import 'package:cross_platform_ui/cross_platform_device_type.dart';
import 'package:cross_platform_ui/cross_platform_type.dart';
import 'package:cross_platform_ui/cross_platform_ui.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Field {
  static CrossPlatformUi text({
    CrossPlatformDeviceType? type,
    TextEditingController? controller,
    InputDecoration? inputDecoration,
    String? placeholder,
    bool obscureText = false,
    int? maxLength,
    TextInputType? keyboardType,
    void Function(String)? onChanged,
  }) {
    type ??= CrossPlatformDeviceType();
    return type.data({
      CrossPlatformType.material: () => TextField(
        controller: controller,
        decoration: inputDecoration,
        obscureText: obscureText,
        maxLength: maxLength,
        keyboardType: keyboardType,
        onChanged: onChanged,
      ),
      CrossPlatformType.cupertino: () => CupertinoTextField(
        prefix: inputDecoration != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (inputDecoration.icon != null) inputDecoration.icon!,
                  if (inputDecoration.label != null) inputDecoration.label!,
                  if (inputDecoration.labelText != null)
                    Text(inputDecoration.labelText!),
                ],
              )
            : null,
        controller: controller,
        placeholder: placeholder,
        obscureText: obscureText,
        maxLength: maxLength,
        keyboardType: keyboardType,
        onChanged: onChanged,
      ),
      CrossPlatformType.fluent: () => TextBox(
        controller: controller,
        placeholder: placeholder,
        obscureText: obscureText,
        maxLength: maxLength,
        keyboardType: keyboardType,
        onChanged: onChanged,
      ),
    });
  }

  static CrossPlatformUi textForm({
    CrossPlatformDeviceType? type,
    TextEditingController? controller,
    InputDecoration? inputDecoration,
    String? placeholder,
    bool obscureText = false,
    int? maxLength,
    TextInputType? keyboardType,
    void Function(String)? onChanged,
    // Form
    String? initialValue,
    String? Function(String?)? validator,
  }) {
    type ??= CrossPlatformDeviceType();
    return type.data({
      CrossPlatformType.material: () => TextFormField(
        controller: controller,
        decoration: inputDecoration,
        initialValue: initialValue,
        obscureText: obscureText,
        validator: validator,
        maxLength: maxLength,
        keyboardType: keyboardType,
        onChanged: onChanged,
      ),
      CrossPlatformType.cupertino: () => CupertinoTextFormFieldRow(
        prefix: inputDecoration != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (inputDecoration.icon != null) inputDecoration.icon!,
                  if (inputDecoration.label != null) inputDecoration.label!,
                  if (inputDecoration.labelText != null)
                    Text(inputDecoration.labelText!),
                ],
              )
            : null,
        controller: controller,
        initialValue: initialValue,
        placeholder: placeholder,
        obscureText: obscureText,
        maxLength: maxLength,
        keyboardType: keyboardType,
        onChanged: onChanged,
      ),
      CrossPlatformType.fluent: () => TextFormBox(
        controller: controller,
        initialValue: initialValue,
        placeholder: placeholder,
        obscureText: obscureText,
        maxLength: maxLength,
        keyboardType: keyboardType,
        onChanged: onChanged,
      ),
    });
  }

  static CrossPlatformUi textSearch({
    CrossPlatformDeviceType? type,
    TextEditingController? controller,
    String? placeholder,
    int? maxLength,
    TextInputType? keyboardType,
    void Function(String)? onChanged,
  }) {
    type ??= CrossPlatformDeviceType();
    return type.data({
      CrossPlatformType.material: () => TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: placeholder,
          icon: Icon(Icons.search),
        ),
        onChanged: onChanged,
        maxLength: maxLength,
        keyboardType: keyboardType,
      ),
      CrossPlatformType.cupertino: () => CupertinoSearchTextField(
        controller: controller,
        placeholder: placeholder,
        onChanged: onChanged,
        keyboardType: keyboardType,
      ),
      CrossPlatformType.fluent: () => TextFormBox(
        controller: controller,
        placeholder: placeholder,
        onChanged: onChanged,
        maxLength: maxLength,
        keyboardType: keyboardType,
      ),
    });
  }
}
