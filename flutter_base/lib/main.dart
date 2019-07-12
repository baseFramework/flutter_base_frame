import 'package:flutter/material.dart';
import 'package:base_library/base_library.dart';
import './pages/login/login_demo1.dart';
import './pages/login/login_demo2.dart';

void main() async {
  /// 等待sp初始化完成后再运行app。
  /// sp初始化时间 release模式下30ms左右，debug模式下100多ms。
  await SpUtil.getInstance();
  runApp(MyAppDemo2());
  // runApp();
}


