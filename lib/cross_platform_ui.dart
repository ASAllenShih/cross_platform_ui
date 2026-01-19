import 'package:cross_platform_ui/cross_platform_type.dart';
import 'package:cross_platform_ui/ui/ui_data.dart';

class CrossPlatformUi<T extends CrossPlatformUi<T>> implements UiData {
  CrossPlatformUi({this.datas = const {}, this.type, this.functionRun = true});
  final Map<CrossPlatformType, dynamic> datas;
  final bool functionRun;
  @override
  CrossPlatformType? type;
  @override
  CrossPlatformType get typeFinal => type ?? typeDefault;
  dynamic get dataGet => datas[typeFinal] ?? datas[CrossPlatformType.all];
  @override
  dynamic get data => functionRun && dataGet is Function ? dataGet() : dataGet;

  static CrossPlatformType typeDefault = CrossPlatformType.material;
}
