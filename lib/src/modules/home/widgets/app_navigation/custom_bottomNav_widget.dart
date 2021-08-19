import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_vollup/src/core/consts/routers_const.dart';
import '../../../../core/consts/app_colors_const.dart';
import '../../../login/login_page.dart';

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
                    Get.toNamed(RoutersConst.login);
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
