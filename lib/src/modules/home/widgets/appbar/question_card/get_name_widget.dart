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
    String? auth = FirebaseAuth.instance.currentUser!.uid;
    final Future<DocumentSnapshot<Map<String, dynamic>>> stream =
        FirebaseFirestore.instance.collection('users').doc('$auth').get();

    if (auth.isNotEmpty) {
      return FutureBuilder<DocumentSnapshot<Object>?>(
        future: stream,
        builder: (BuildContext context, snapshot) {
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

          if (snapshot.connectionState == ConnectionState.done) {
            var data = snapshot.data!.data() as Map<String, dynamic>;

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
    } else {
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
  }
}
