import 'package:cross_platform_ui/cross_platform_type.dart';
import 'package:cross_platform_ui/cross_platform_ui.dart';
import 'package:cross_platform_ui/ui/widget/ui_widget.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CrossPlatformFieldTextSearch
    extends CrossPlatformUi<CrossPlatformFieldTextSearch>
    with UiWidget {
  CrossPlatformFieldTextSearch({
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
         },
       );
}
