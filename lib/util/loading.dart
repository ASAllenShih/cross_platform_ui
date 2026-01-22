import 'package:cross_platform_ui/cross_platform.dart';
import 'package:cross_platform_ui/cross_platform_type.dart';
import 'package:flutter/material.dart';

class Loading {
  Loading({this.status = true, this.loadingText, this.crossPlatformType});
  bool status;
  String? loadingText;
  CrossPlatformType? crossPlatformType;
  void on({void Function(void Function())? setState}) {
    if (setState != null) {
      setState(() {
        status = true;
      });
      return;
    }
    status = true;
  }

  void off({void Function(void Function())? setState}) {
    if (setState != null) {
      setState(() {
        status = false;
      });
      return;
    }
    status = false;
  }

  List<Widget> get widgets => <Widget>[
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        CrossPlatformProgressIndicator(type: crossPlatformType).widget,
      ],
    ),
    if (loadingText != null)
      Text(
        loadingText!,
        textScaler: TextScaler.linear(1.5),
        textAlign: TextAlign.center,
      ),
  ];

  Widget get widget => Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: widgets,
  );
}

class LoadingWithProgress extends Loading {
  LoadingWithProgress({
    super.status = true,
    super.loadingText,
    super.crossPlatformType,
  });
  final Map<String, int> _loadNow = <String, int>{};
  final Map<String, int> _loadTotal = <String, int>{};
  void setProgress(
    String key,
    int now,
    int total, {
    void Function(void Function())? setState,
  }) {
    if (setState != null) {
      setState(() {
        _loadNow[key] = now;
        _loadTotal[key] = total;
      });
      return;
    }
    _loadNow[key] = now;
    _loadTotal[key] = total;
  }

  void Function(int now, int total, {void Function(void Function())? setState})
  onProgress(String key) {
    return (int now, int total, {void Function(void Function())? setState}) {
      setProgress(key, now, total, setState: setState);
    };
  }

  void clear() {
    _loadNow.clear();
    _loadTotal.clear();
  }

  int get _loadNowSum =>
      _loadNow.isEmpty ? 0 : _loadNow.values.reduce((int a, int b) => a + b);
  int get _loadTotalSum => _loadTotal.isEmpty
      ? 0
      : _loadTotal.values.reduce((int a, int b) => a + b);
  double get _loadRatio => (_loadTotalSum == 0
      ? 0
      : (_loadNowSum > _loadTotalSum ? 1 : _loadNowSum / _loadTotalSum));
  double get _loadPercentage => _loadRatio * 100;
  String get _progressText =>
      '${_loadPercentage.toStringAsFixed(2)}% ($_loadNowSum/$_loadTotalSum)';
  @override
  List<Widget> get widgets => super.widgets
    ..addAll(<Widget>[
      Text(_progressText, textAlign: TextAlign.center),
      LinearProgressIndicator(value: _loadRatio),
    ]);
}
