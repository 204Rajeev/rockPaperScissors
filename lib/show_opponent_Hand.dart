import 'package:flutter/material.dart';

class showOpponentHand extends StatelessWidget {
  String oppUrl;
  int score;

  showOpponentHand(this.oppUrl, this.score, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 30, 10),
              margin: EdgeInsets.all(0),
              decoration:
                  BoxDecoration(color: Color(0xFF0000).withOpacity(0.3)),
              child: Text(
                score.toString(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.all(30),
          height: 250,
          width: double.infinity,
          child: Image.asset(oppUrl),
        ),
      ]),
    );
  }
}
