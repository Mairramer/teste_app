import 'package:flutter/material.dart';
import '../../../../core/consts/app_images_const.dart';
import '../../../../core/consts/app_text_styles_const.dart';
import 'get_balance.dart';

class InfoAppBarWidget extends StatefulWidget {
  const InfoAppBarWidget({Key? key}) : super(key: key);

  @override
  _InfoAppBarWidgetState createState() => _InfoAppBarWidgetState();
}

class _InfoAppBarWidgetState extends State<InfoAppBarWidget> {
  final String text = '0.00';
  bool _isShown = true;
  Icon _icon = Icon(Icons.visibility_off_outlined);
  Icon _iconShow = Icon(Icons.visibility_outlined);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      width: double.maxFinite,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 20),
            height: 80,
            width: 160,
            child: Image.asset(AppImagesConst.logoFull),
          ),
          Divider(
            color: Colors.transparent,
            height: 5,
          ),
          Text(
            'Saldo atual',
            style: AppTextStylesConst.balanceText,
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: _isShown,
                  child: GetBalance(),
                ),
                IconButton(
                  icon: (_isShown) ? _icon : _iconShow,
                  color: Colors.white,
                  onPressed: () {
                    setState(() {
                      _isShown = !_isShown;
                    });
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: 70,
          )
        ],
      ),
    );
  }
}
