import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import '../core/consts/routers_const.dart';
import '../modules/home/home_page.dart';
import '../modules/login/login_page.dart';
import '../modules/register/register_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return GetMaterialApp(
        title: 'Flutter Modular',
        initialRoute: RoutersConst.home,
        //home: LoginPage(),
        routes: {
          RoutersConst.home: (context) => HomePage(),
          RoutersConst.login: (context) => LoginPage(),
          RoutersConst.register: (context) => RegisterPage(),
        },
      );
    });
  }
}
