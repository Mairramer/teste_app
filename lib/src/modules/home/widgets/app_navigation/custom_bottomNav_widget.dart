import 'package:flutter/material.dart';
import 'package:teste_vollup/src/core/consts/app_colors_const.dart';
import 'package:teste_vollup/src/modules/home/widgets/appbar/get_balance.dart';
import 'package:teste_vollup/src/modules/login/login_page.dart';

import '../../home_controller.dart';

class CustomBottomNavigatorWidget extends StatefulWidget {
  const CustomBottomNavigatorWidget({Key? key}) : super(key: key);

  @override
  _CustomBottomNavigatorWidgetState createState() =>
      _CustomBottomNavigatorWidgetState();
}

class _CustomBottomNavigatorWidgetState
    extends State<CustomBottomNavigatorWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = HomeController();
    return Container(
      color: Colors.white.withOpacity(0.9),
      width: double.maxFinite,
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                    setState(() => controller.setPage(0));
                  },
                  icon: Icon(
                    Icons.person,
                    size: 32,
                    color: controller.currentPage == 0
                        ? AppColorsConst.primary
                        : AppColorsConst.green,
                  )),
              Text('perfil')
            ],
          ),
          Column(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => GetBalance()));
                    setState(() => controller.setPage(1));
                  },
                  icon: Icon(
                    Icons.list_rounded,
                    size: 32,
                    color: controller.currentPage == 1
                        ? AppColorsConst.primary
                        : AppColorsConst.green,
                  )),
              Text('menu')
            ],
          )
        ],
      ),
    );
  }
}
