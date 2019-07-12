import 'package:flutter/material.dart';
import 'package:base_library/base_library.dart';
import '../../login_page.dart';
import '../../main_page.dart';
import '../../components/splash/splash.dart';

class MyAppDemo2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyAppDemoState2();
  }
}

class MyAppDemoState2 extends State<MyAppDemo2> {
  @override
  void initState() {
    super.initState();
    _initAsync();
  }

  ///异步初始化sp。
  void _initAsync() async {
    await SpUtil.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      routes: {
        BaseConstant.routeMain: (ctx) => MainPage(),
        BaseConstant.routeLogin: (ctx) => LoginPage(),
      },
      home: SplashPage(),
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.deepPurpleAccent,
      ),
    );
  }
}
