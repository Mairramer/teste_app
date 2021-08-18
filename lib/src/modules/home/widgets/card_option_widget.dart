import 'package:flutter/material.dart';
import '../../../core/consts/app_text_styles_const.dart';
import 'detail_widget.dart';

class CardOptionWidget extends StatelessWidget {
  final String text;
  final String subText;
  final image;
  final VoidCallback onTap;
  const CardOptionWidget(
      {Key? key,
      required this.onTap,
      required this.text,
      required this.image,
      required this.subText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
              height: 250,
              width: 250,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(1, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(5),
                border: Border.fromBorderSide(BorderSide(color: Colors.white)),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 20),
                  Container(
                    child: Image.asset(image),
                    height: 30,
                    width: 30,
                  ),
                  SizedBox(height: 10),
                  Text.rich(
                    TextSpan(
                      text: text,
                      style: AppTextStylesConst.homeOptions,
                      children: [
                        TextSpan(
                          text: subText,
                          style: AppTextStylesConst.homeOptions,
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          Align(
            widthFactor: 8,
            alignment: Alignment(1, -0.1),
            child: DetailWidget(),
          ),
        ],
      ),
    );
  }
}
