import 'package:cross_platform_ui/cross_platform_type.dart';
import 'package:cross_platform_ui/cross_platform_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<T?> dialogShow<T>({
  required BuildContext context,
  required Widget Function(BuildContext) builder,
  bool? barrierDismissible,
  CrossPlatformType? type,
}) {
  type ??= CrossPlatformUi.typeDefault;
  if (type == CrossPlatformType.material) {
    return showDialog<T>(
      context: context,
      builder: builder,
      barrierDismissible: barrierDismissible ?? true,
    );
  } else if (type == CrossPlatformType.cupertino) {
    return showCupertinoDialog<T>(
      context: context,
      builder: builder,
      barrierDismissible: barrierDismissible ?? false,
    );
  } else {
    throw Exception('Unsupported dialog builder type');
  }
}
