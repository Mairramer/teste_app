import 'package:flutter/material.dart';
import 'package:teste_vollup/src/core/consts/app_colors_const.dart';

class DetailWidget extends StatelessWidget {
  const DetailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 10,
          width: 30,
          color: AppColorsConst.green,
        ),
      ],
    );
  }
}
