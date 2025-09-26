import 'dart:async';

import 'package:cross_platform_ui/cross_platform_device_type.dart';
import 'package:cross_platform_ui/cross_platform_type.dart';
import 'package:cross_platform_ui/cross_platform_ui.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Custom {
  static CrossPlatformUi progressIndicator({
    CrossPlatformDeviceType? type,
    double? value,
  }) {
    type ??= CrossPlatformDeviceType();
    return type.data({
      CrossPlatformType.material: () => CircularProgressIndicator(value: value),
      CrossPlatformType.cupertino: () => value == null
          ? CupertinoActivityIndicator()
          : CupertinoActivityIndicator.partiallyRevealed(progress: value),
      CrossPlatformType.fluent: () =>
          ProgressRing(value: value == null ? null : value / 100),
    });
  }

  static CrossPlatformUi futureWidget({
    CrossPlatformDeviceType? type,
    required FutureOr<Widget> future,
  }) {
    if (future is Widget) {
      return CrossPlatformUi(dataDefault: future);
    }
    type ??= CrossPlatformDeviceType();
    return type.data({
      CrossPlatformType.material: () => FutureBuilder<Widget>(
        future: future,
        builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return progressIndicator(type: type).widget;
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return snapshot.data!;
          }
        },
      ),
      CrossPlatformType.cupertino: () => FutureBuilder<Widget>(
        future: future,
        builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return progressIndicator(type: type).widget;
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return snapshot.data!;
          }
        },
      ),
      CrossPlatformType.fluent: () => FutureBuilder<Widget>(
        future: future,
        builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return progressIndicator(type: type).widget;
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return snapshot.data!;
          }
        },
      ),
    });
  }
}
