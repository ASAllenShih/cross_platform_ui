import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as material_widgets show showDialog;
import 'package:fluent_ui/fluent_ui.dart' as fluent_widgets show showDialog;
import 'package:flutter/material.dart';

Future<T?> dialogShow<T>({
  required BuildContext context,
  required Widget Function(BuildContext) builder,
  bool? barrierDismissible,
}) {
  if (builder is AlertDialog Function(BuildContext)) {
    return material_widgets.showDialog<T>(context: context, builder: builder);
  } else if (builder is CupertinoAlertDialog Function(BuildContext)) {
    return showCupertinoDialog<T>(context: context, builder: builder);
  } else if (builder is ContentDialog Function(BuildContext)) {
    return fluent_widgets.showDialog<T>(context: context, builder: builder);
  } else {
    throw Exception('Unsupported dialog builder type');
  }
}
