import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/consts/app_text_styles_const.dart';

class GetBalance extends StatefulWidget {
  @override
  _GetBalanceState createState() => _GetBalanceState();
}

class _GetBalanceState extends State<GetBalance> {
  @override
  Widget build(BuildContext context) {
    final String auth = FirebaseAuth.instance.currentUser!.uid;

    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance.collection('users').doc('$auth').get(),
      builder: (BuildContext context,
          AsyncSnapshot<DocumentSnapshot<Object?>> snapshot) {
        if (snapshot.connectionState == ConnectionState.none) {
          return Text(
            '0.00',
            style: AppTextStylesConst.balanceValue,
          );
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text(
            '0.00',
            style: AppTextStylesConst.balanceValue,
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          var data = snapshot.data!.data() as Map;
          String balance = data['balance'].toString();

          return Text(
            NumberFormat.simpleCurrency(locale: 'pt_BR')
                .format(double.parse(balance)),
            style: AppTextStylesConst.balanceValue,
          );
        }

        return CircularProgressIndicator();
      },
    );
  }
}
