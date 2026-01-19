import 'dart:async';

import 'package:cross_platform_ui/cross_platform/other/progress_indicator.dart';
import 'package:cross_platform_ui/cross_platform_type.dart';
import 'package:cross_platform_ui/cross_platform_ui.dart';
import 'package:cross_platform_ui/method/method_widget.dart';
import 'package:cross_platform_ui/ui/widget/ui_widget.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CrossPlatformFutureWidget
    extends CrossPlatformUi<CrossPlatformFutureWidget>
    with UiWidget {
  CrossPlatformFutureWidget({
    required Future<dynamic> future,
    dynamic loadingWidget,
    super.type,
  }) : super(
         datas: {
           CrossPlatformType.all: () => FutureBuilder<dynamic>(
             future: future,
             builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
               if (snapshot.connectionState == ConnectionState.waiting) {
                 return methodWidget(
                   loadingWidget ?? CrossPlatformProgressIndicator(),
                 );
               } else if (snapshot.hasError) {
                 return Text('Error: ${snapshot.error}');
               } else {
                 return methodWidget(snapshot.data);
               }
             },
           ),
         },
       );
}
