import 'package:flutter/material.dart';
import 'package:teste_vollup/src/core/consts/app_images_const.dart';

import '../home_controller.dart';
import 'card_option_widget.dart';

class HomeBuild extends StatelessWidget {
  HomeBuild({Key? key}) : super(key: key);
  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: Column(children: [
        SizedBox(
          height: 50,
        ),
        Expanded(
          child: GridView.count(
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            crossAxisCount: 2,
            children: [
              CardOptionWidget(
                onTap: () {},
                image: AppImagesConst.barcode,
                text: 'Pagar\n',
                subText: 'contas',
              ),
              CardOptionWidget(
                onTap: () {
                  controller.incrementValue();
                  print('clicked');
                },
                image: AppImagesConst.wallet,
                text: 'Carregar\n',
                subText: 'carteira',
              ),
              CardOptionWidget(
                onTap: () {},
                image: AppImagesConst.shopList,
                text: 'Histórico\n',
                subText: 'de pagamentos',
              ),
              CardOptionWidget(
                onTap: () {},
                image: AppImagesConst.money,
                text: 'Fazer\n',
                subText: 'transferência',
              ),
            ],
          ),
        )
      ]),
    );
  }
}
