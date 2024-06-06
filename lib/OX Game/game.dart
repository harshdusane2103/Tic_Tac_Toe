import 'package:flutter/material.dart';
import 'package:tic_tce_toe_ui/utils/global.dart';


class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late List<List<String>> board;
  late String currentPlayer;
  late String winner;
  late bool gameOver;

  @override
  void initState() {
    super.initState();
    board = List.generate(3, (_) => List.generate(3, (_) => ""));
    currentPlayer = "x";
    winner = "";
    gameOver = false;
  }

  void resetGame() {
    setState(() {
      board = List.generate(3, (_) => List.generate(3, (_) => ""));
      currentPlayer = "x";
      winner = "";
      gameOver = false;
    });
  }

  void makeMove(int row, int col) {
    if (board[row][col] != "" || gameOver) {
      return;
    }
    setState(() {
      board[row][col] = currentPlayer;
      if (board[row][0] == currentPlayer &&
          board[row][1] == currentPlayer &&
          board[row][2] == currentPlayer) {
        winner = currentPlayer;
        gameOver = true;
      } else if (board[0][col] == currentPlayer &&
          board[1][col] == currentPlayer &&
          board[2][col] == currentPlayer) {
        winner = currentPlayer;
        gameOver = true;
      } else if (board[0][0] == currentPlayer &&
          board[1][1] == currentPlayer &&
          board[2][2] == currentPlayer) {
        winner = currentPlayer;
        gameOver = true;
      } else if (board[0][2] == currentPlayer &&
          board[1][1] == currentPlayer &&
          board[2][0] == currentPlayer) {
        winner = currentPlayer;
        gameOver = true;
      }
      currentPlayer = currentPlayer == "x" ? "o" : "x";
      if (!board.any((row) => row.any((cell) => cell == ""))) {
        gameOver = true;
        winner = "It's a Tie ";
      }
      if (winner != "") {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                winner == "x"
                    ? "$Player1 Won!"
                    : winner == "o"
                        ? "$Player2 Won!"
                        : "Match tied!",
                style: TextStyle(color: Colors.red, fontSize: 32),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    resetGame();
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Reset",
                    style: TextStyle(color: Colors.black),
                  ),
                )
              ],
            );
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(height: 120),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Turn : ",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                    Text(
                      currentPlayer == "x"
                          ? "$Player1 ($currentPlayer)"
                          : "$Player2 ($currentPlayer)",
                      style: TextStyle(
                          fontSize: 30,
                          color: currentPlayer == "x"
                              ? Colors.red
                              : Colors.teal),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.all(5),
                  child: GridView.builder(
                    itemCount: 9,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemBuilder: (context, index) {
                      int row = index ~/ 3;
                      int col = index % 3;
                      return GestureDetector(
                        onTap: () => makeMove(row, col),
                        child: Container(
                          margin: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              board[row][col],
                              style: TextStyle(
                                fontSize: 80,
                                fontWeight: FontWeight.bold,
                                color: board[row][col] == "x"
                                    ? Colors.red
                                    : Colors.teal,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  children: [],
                ),
                SizedBox(width: 20),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 30),
                    InkWell(
                      onTap: resetGame,
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green,
                        ),
                        child: Center(
                          child: Text(
                            'Reset',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop('/sp');
                      },
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.orange,
                        ),
                        child: Center(
                          child: Text(
                            'ReStart',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
