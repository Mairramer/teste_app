import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../../../core/consts/app_colors_const.dart';
import '../../../../../core/consts/app_text_styles_const.dart';

class GetName extends StatefulWidget {
  @override
  _GetNameState createState() => _GetNameState();
}

class _GetNameState extends State<GetName> {
  @override
  Widget build(BuildContext context) {
    final String auth = FirebaseAuth.instance.currentUser!.uid;

    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance.collection('users').doc('$auth').get(),
      builder: (BuildContext context,
          AsyncSnapshot<DocumentSnapshot<Object?>> snapshot) {
        if (snapshot.hasError) {
          return Container(
              padding: EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: Text.rich(
                TextSpan(
                    text: 'Olá, ',
                    style: AppTextStylesConst.homeOptions,
                    children: [
                      TextSpan(
                          text: 'erro\n',
                          style: TextStyle(
                            color: AppColorsConst.green,
                          )),
                      TextSpan(text: 'Qual sua próxima operação?')
                    ]),
                textAlign: TextAlign.center,
              ));
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Container(
              padding: EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: Text.rich(
                TextSpan(
                    text: 'Olá, ',
                    style: AppTextStylesConst.homeOptions,
                    children: [
                      TextSpan(
                          text: 'Usuario\n',
                          style: TextStyle(
                            color: AppColorsConst.green,
                          )),
                      TextSpan(text: 'Qual sua próxima operação?')
                    ]),
                textAlign: TextAlign.center,
              ));
        }

        if (snapshot.connectionState == ConnectionState.done) {
          var data = snapshot.data!.data() as Map;

          String? name = data['name'];

          return GestureDetector(
            child: Container(
              padding: EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: Text.rich(
                TextSpan(
                    text: 'Olá, ',
                    style: AppTextStylesConst.homeOptions,
                    children: [
                      TextSpan(
                          text: '$name\n',
                          style: TextStyle(
                            color: AppColorsConst.green,
                          )),
                      TextSpan(text: 'Qual sua próxima operação?')
                    ]),
                textAlign: TextAlign.center,
              ),
            ),
          );
        }

        return Text('...');
      },
    );
  }
}
