import 'package:flutter/material.dart';
import 'widgets/appbar/app_bar_widget.dart';
import 'widgets/app_navigation/custom_bottomNav_widget.dart';
import 'widgets/customFloatButton/custom_floatingAction_widget.dart';
import 'widgets/home_build.dart';
import '../login/login_page.dart';
import '../register/register_page.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const FloatingActionButtonLocation centerDocked =
      FloatingActionButtonLocation.centerDocked;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final controller = HomeController();

    return Scaffold(
        appBar: AppBarWidget(),
        backgroundColor: Colors.white.withOpacity(0.94),
        bottomNavigationBar: CustomBottomNavigatorWidget(),
        floatingActionButton: CustomFloatingActionButton(),
        floatingActionButtonLocation: HomePage.centerDocked,
        body: [HomeBuild(), LoginPage(), RegisterPage()][controller.currentPage]
        //
        );
  }
}
