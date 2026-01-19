import 'package:cross_platform_ui/cross_platform_type.dart';

abstract class UiData<T> {
  dynamic get data;
  CrossPlatformType? type;
  CrossPlatformType get typeFinal;
}
