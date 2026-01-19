import 'package:cross_platform_ui/cross_platform_type.dart';
import 'package:cross_platform_ui/cross_platform_ui.dart';
import 'package:cross_platform_ui/ui/widget/ui_widget.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CrossPlatformFieldTextForm
    extends CrossPlatformUi<CrossPlatformFieldTextForm> with UiWidget {
  CrossPlatformFieldTextForm({
    TextEditingController? controller,
    InputDecoration? inputDecoration,
    String? placeholder,
    bool obscureText = false,
    int? maxLength,
    TextInputType? keyboardType,
    void Function(String)? onChanged,
    String? initialValue,
    String? Function(String?)? validator,
    super.type,
  }) : super(
         datas: {
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
                       if (inputDecoration.label != null)
                         inputDecoration.label!,
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
         },
       );
}
