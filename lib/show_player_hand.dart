import 'package:flutter/material.dart';

class ShowPlayerHand extends StatelessWidget {
  //const ShowPlayerHand({Key? key}) : super(key: key);

  String playerUrl;
  int score;
  ShowPlayerHand(this.playerUrl, this.score, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        padding: EdgeInsets.all(20),
        height: 250,
        width: double.infinity,
        child: Image.asset(playerUrl),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 30, 10),
            margin: EdgeInsets.all(0),
            decoration:
                BoxDecoration(color: Color(0x00000000FF).withOpacity(0.3)),
            child: Text(
              score.toString(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          margin: EdgeInsets.all(0),
          decoration:
              BoxDecoration(color: Color(0x00000000FF).withOpacity(0.3)),
          child: Text(
            'You',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ]),
    ]);
  }
}
