import 'package:_game/show_opponent_Hand.dart';
import 'package:_game/show_player_hand.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main(List<String> args) {
  runApp(RockPaperScissors());
}

class RockPaperScissors extends StatefulWidget {
  @override
  State<RockPaperScissors> createState() => _RockPaperScissorsState();
}

class _RockPaperScissorsState extends State<RockPaperScissors> {
  Random random = Random();
  String playerUrl = 'assets/images/you.jpg';
  String oppUrl = 'assets/images/opponent.jpg';
  var oppNum;
  newGame() {
    setState(() {
      scoreOfPlayer = 0;
      scoreOfOpponent = 0;
      playerUrl = 'assets/images/you.jpg';
      oppUrl = 'assets/images/opponent.jpg';
    });
    Navigator.of(context).pop();
  }

  int scoreOfPlayer = 0, scoreOfOpponent = 0;

  void setStone() {
    oppNum = random.nextInt(3);
    setState(() {
      playerUrl = 'assets/images/stoneAi.jpg';
      if (oppNum == 2) {
        scoreOfPlayer++;
        oppUrl = 'assets/images/sissorAi.jpg';
      } else if (oppNum == 1) {
        scoreOfOpponent++;
        oppUrl = 'assets/images/paperAi.jpg';
      } else {
        oppUrl = 'assets/images/stoneAi.jpg';
      }
    });
  }

  void setPaper() {
    oppNum = random.nextInt(3);
    setState(() {
      playerUrl = 'assets/images/paperAi.jpg';
      if (oppNum == 0) {
        scoreOfPlayer++;
        oppUrl = 'assets/images/stoneAi.jpg';
      } else if (oppNum == 2) {
        scoreOfOpponent++;
        oppUrl = 'assets/images/sissorAi.jpg';
      } else {
        oppUrl = 'assets/images/paperAi.jpg';
      }
    });
  }

  void setSissors() {
    oppNum = random.nextInt(3);
    setState(() {
      playerUrl = 'assets/images/sissorAi.jpg';
      if (oppNum == 1) {
        scoreOfPlayer++;
        oppUrl = 'assets/images/paperAi.jpg';
      } else if (oppNum == 0) {
        scoreOfOpponent++;
        oppUrl = 'assets/images/stoneAi.jpg';
      } else {
        oppUrl = 'assets/images/sissorAi.jpg';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome Player'),
        ),
        body: SizedBox(
          height: 900,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () => setStone(),
                        child: const Text('Stone')),
                    ElevatedButton(
                        onPressed: () => setPaper(),
                        child: const Text('Paper')),
                    ElevatedButton(
                        onPressed: () => setSissors(),
                        child: const Text('Scissors'))
                  ],
                ),
                const SizedBox(
                  height: 70,
                ),
                ShowPlayerHand(playerUrl, scoreOfPlayer),
                const SizedBox(
                  height: 10,
                ),
                showOpponentHand(oppUrl, scoreOfOpponent),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FloatingActionButton(
                        onPressed: newGame,
                        child: const Icon(Icons.refresh),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
