import 'package:flutter/material.dart';
import 'package:teste_vollup/src/modules/home/widgets/appbar/question_card/get_name_widget.dart';

class QuestionCardWidget extends StatefulWidget {
  const QuestionCardWidget({Key? key}) : super(key: key);

  @override
  _QuestionCardWidgetState createState() => _QuestionCardWidgetState();
}

class _QuestionCardWidgetState extends State<QuestionCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
            height: 70,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(
                        width: 3,
                        color: Colors.white.withOpacity(0.9),
                        style: BorderStyle.none,
                      ),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  child: GetName()),
            )));
  }
}
