import 'package:flutter/material.dart';
import 'package:base_library/base_library.dart';



class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SplashPageState();
  }
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() {
    ///默认展示1秒启动图。
    Future.delayed(new Duration(milliseconds: 5000), () async {
      ///再次确保sp完全初始化。
      await SpUtil.getInstance();
      ///是否显示引导页。
      if (SpUtil.getBool(BaseConstant.keyShowGuide, defValue: true)) {
        _initGuide();
      } else {
        _initSplash();
      }
    });
  }

  ///引导页逻辑。
  void _initGuide() {
    ///.... 引导页逻辑已完。
    ///已登录，跳转到主页。
    ///未登录跳登录页。
    if (Util.isLogin()) {
      RouteUtil.goMain(context);
    } else {
      RouteUtil.pushReplacementNamed(context, BaseConstant.routeLogin);
    }
  }

  ///闪屏广告逻辑
  void _initSplash() {
    ///已登录，显示3秒广告图后，跳转到主页。
    ///未登录跳登录页。
    if (Util.isLogin()) {
      Future.delayed(new Duration(milliseconds: 3000), () {
        RouteUtil.goMain(context);
      });
    } else {
      RouteUtil.pushReplacementNamed(context, BaseConstant.routeLogin);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text("欢迎来到 flutter 的世界！！！",style: TextStyle(fontSize: 26.0,color: Colors.pink),),
      ),
    );
  }
}