import 'package:cross_platform_ui/cross_platform_type.dart';
import 'package:cross_platform_ui/cross_platform_ui.dart';
import 'package:cross_platform_ui/ui/widget/ui_widget.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CrossPlatformFieldText extends CrossPlatformUi<CrossPlatformFieldText>
    with UiWidget {
  CrossPlatformFieldText({
    TextEditingController? controller,
    InputDecoration? inputDecoration,
    String? placeholder,
    bool obscureText = false,
    int? maxLength,
    TextInputType? keyboardType,
    void Function(String)? onChanged,
    super.type,
  }) : super(
         datas: {
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
                       if (inputDecoration.label != null)
                         inputDecoration.label!,
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
         },
       );
}
