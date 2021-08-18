import 'package:flutter/material.dart';
import '../../../../core/consts/app_images_const.dart';
import 'info_appbar_widget.dart';

import 'question_card/question_card_widget.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget()
      : super(
          preferredSize: Size.fromHeight(250),
          child: Container(
            height: 220,
            color: Colors.deepPurple,
            child: Stack(
              children: [
                Container(
                  height: 220,
                  width: double.infinity,
                  child: Image.asset(
                    AppImagesConst.background,
                    scale: 1,
                  ),
                ),
                InfoAppBarWidget(),
                Align(
                  alignment: Alignment(0, 1),
                  child: QuestionCardWidget(),
                )
              ],
            ),
          ),
        );
}
