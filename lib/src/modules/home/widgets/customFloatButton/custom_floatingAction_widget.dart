import 'package:flutter/material.dart';
import 'package:teste_vollup/src/core/consts/app_colors_const.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0, 0.95),
      child: Container(
          height: MediaQuery.of(context).size.width * 0.3,
          width: MediaQuery.of(context).size.width * 0.2,
          child: FloatingActionButton(
              onPressed: () {},
              child: Text(
                'Y',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: AppColorsConst.green,
              shape: CircleBorder(
                side: BorderSide(color: AppColorsConst.textColor, width: 4.0),
              ))),
    );
  }
}
