import 'package:flutter/material.dart';

class Tictactoe extends StatefulWidget {
  const Tictactoe({super.key});

  @override
  State<Tictactoe> createState() => _TictactoeState();
}

bool xturn = false;

List<String> display = ["", "", "", "", "", "", "", "", ""];
int scoreo = 0;
int scorex = 0;

var filledboxes = 0;

class _TictactoeState extends State<Tictactoe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Column(children: [
              Text(
                "Score of X",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
              Text(
                scorex.toString(),
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(children: [
                Text(
                  "Score of O",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                Text(
                  scoreo.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ]),
            ),
          ]),
          Expanded(
            child: GridView.builder(
              itemCount: 9,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  tap(index);
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 199, 130, 130))),
                  child: Center(
                      child: Text(
                    // index.toString(),

                    display[index],
                    style: TextStyle(fontSize: 35, color: Colors.white),
                  )),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(45.0),
            child: Text(
              "Tic Tac Toe",
              style: TextStyle(fontSize: 35, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  void tap(int index) {
    setState(() {
      if (xturn && display[index] == "") {
        display[index] = "X";
        filledboxes += 1;
      } else if (!xturn && display[index] == "") {
        display[index] = "O";
        filledboxes += 1;
      }
      xturn = !xturn;

      checkwinner();
    });
  }

  void checkwinner() {
    if (display[0] == display[1] &&
        display[0] == display[2] &&
        display[0] != "") {
      winneralert(display[0]);
    }
    if (display[3] == display[4] &&
        display[3] == display[5] &&
        display[3] != "") {
      winneralert(display[3]);
    }
    if (display[6] == display[7] &&
        display[6] == display[8] &&
        display[6] != "") {
      winneralert(display[6]);
    }

    if (display[0] == display[3] &&
        display[0] == display[6] &&
        display[0] != "") {
      winneralert(display[0]);
    }
    if (display[1] == display[4] &&
        display[1] == display[7] &&
        display[1] != "") {
      winneralert(display[1]);
    }
    if (display[2] == display[5] &&
        display[2] == display[8] &&
        display[2] != "") {
      winneralert(display[2]);
    }
    if (display[0] == display[4] &&
        display[0] == display[8] &&
        display[0] != "") {
      winneralert(display[0]);
    }
    if (display[2] == display[4] &&
        display[2] == display[6] &&
        display[2] != "") {
      winneralert(display[2]);
    } else if (filledboxes == 9) {
      showdrawdialog();
    }
  }

  void showdrawdialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color.fromARGB(255, 213, 231, 240),
        title: Text(
          "Draw",
          style: TextStyle(fontSize: 25),
        ),
        actions: [
          TextButton(
              onPressed: () {
                setState(() {
                  clearboard();
                });
                Navigator.of(context).pop();
              },
              child: Text("Play Again!"))
        ],
      ),
    );
  }

  void winneralert(String winner) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color.fromARGB(255, 213, 231, 240),
        title: Text(
          "Winner is  $winner",
          style: TextStyle(fontSize: 25),
        ),
        actions: [
          TextButton(
              onPressed: () {
                setState(() {
                  clearboard();
                });
                Navigator.of(context).pop();
              },
              child: Text("Play Agian!"))
        ],
      ),
    );

    if (winner == "X") {
      setState(() {
        scorex += 1;
      });
    } else if (winner == "O") {
      setState(() {
        scoreo += 1;
      });
    }
  }

  void clearboard() {
    for (var i = 0; i < 9; i++) {
      display[i] = "";
    }
    filledboxes = 0;
  }
}
