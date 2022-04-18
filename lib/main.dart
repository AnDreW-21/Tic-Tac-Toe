import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
bool check=true;
var list = [
  ["", "", ""],
  ["", "", ""],
  ["", "", ""]
];
var element = "O";
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              'Tic Tac Toe',
              style: TextStyle(
                  fontFamily: 'firstFont',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            backgroundColor: Colors.red,
            leading: Icon(Icons.adb_rounded, color: Colors.white),
          ),
          body: Game(),
        ));
  }
}

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(shape: BoxShape.rectangle),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [addElement(0, 0), addElement(0, 1), addElement(0, 2)],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [addElement(1, 0), addElement(1, 1), addElement(1, 2)],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [addElement(2, 0), addElement(2, 1), addElement(2, 2)],
            )
          ],
        ),
      ),
      backgroundColor: (check==false)?Colors.black:Colors.white,
    );
  }

  Container addElement(int r, int c) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 1.0, color: Colors.red),
          left: BorderSide(width: 1.0, color: Colors.blueAccent),
          right: BorderSide(width: 1.0, color: Colors.red),
          bottom: BorderSide(width: 1.0, color: Colors.blue),
        ),
      ),
      child: FlatButton(
        onPressed: () {
          if (list[r][c].isEmpty) {
            setState(
                  () {
                    check=!check;
                list[r][c] = element;
                if (element == "X") {
                  element = "O";
                } else {
                  element = "X";
                }
              },
            );
          }
          WhoISWinner(r, c);
        },
        child: Text("${list[r][c]}",
            style: TextStyle(
                fontSize: 40,
                color: Colors.redAccent,
                fontWeight: FontWeight.bold)),
      ),
    );
  }

  WhoISWinner(int r, int c) {
    var col = 0,
        row = 0,
        rCurve = 0,
        lCurve = 0;
    int length = list.length - 1;
    var player1 = list[r][c];
    for (int i = 0; i < list.length; i++) {
      if (list[r][i] == player1) {
        col++;
      }
      if (list[i][c] == player1) {
        row++;
      }
      if (list[i][i] == player1) {
        rCurve++;
      }
      if (list[i][length - 1] == player1) {
        lCurve++;
      }
    }
    if (row == length + 1 || col == length + 1 || rCurve == length + 1 ||
        lCurve == length + 1) {
       showDialog(
          context: context,
          builder: (BuildContext context) => new AlertDialog(
            title: new Text('congratulations'),
            content: new Text('Hey $player1 is the winner❤️❤'),
            actions: <Widget>[
              new IconButton(
                  icon: new Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
          ));
    }
  }
}
