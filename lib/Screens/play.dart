import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/ComputerLogic/judge.dart';
import 'package:tic_tac_toe/ComputerLogic/minimax.dart';
import 'package:tic_tac_toe/GameInstance/board.dart';
//import 'package:tic_tac_toe/ComputerLogic/random.dart';

class play extends StatelessWidget {
  const play({super.key});

  @override
  Widget build(BuildContext context) {
    return const TicTacToeBoard();
  }
}

class TicTacToeBoard extends StatefulWidget {
  const TicTacToeBoard({super.key});

  @override
  _TicTacToeBoardState createState() => _TicTacToeBoardState();
}

class _TicTacToeBoardState extends State<TicTacToeBoard> {
  //List<List<String>> board = List.generate(3, (_) => List.filled(3, ''));
  Board board = Board();
  String hasWon = '';
  int games = 0;
  int X_wins = 0;
  int O_wins = 0;
  void place(int row, int column, int player) {
    setState(() {
      if (board.board[row][column].isEmpty) {
        if (player == 1) {
          board.board[row][column] = 'X';
        } else {
          board.board[row][column] = 'O';
        }
      }
    });
  }

  void restart() {
    setState(() {
      games++;
      if (hasWon == 'X') {
        X_wins++;
      } else if(hasWon == 'O')
        O_wins++;
      hasWon = '';
      for (int i = 0; i < 9; i++) {
        board.board[i ~/ 3][i % 3] = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double? size = 
        min(0.6 * MediaQuery.of(context).size.height,
            0.6 * MediaQuery.of(context).size.width);
    print(size);
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 238, 248, 157),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(
                  child: Card(
                    elevation: 28,
                    shadowColor: const Color.fromARGB(179, 17, 86, 190),
                    child: SizedBox(
                      height: size,
                      width: size,
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 12,
                                  mainAxisSpacing: 12),
                          itemCount: 9,
                          itemBuilder: (context, index) {
                            int row = index ~/ 3;
                            int col = index % 3;
                            return GestureDetector(
                                onTap: () {
                                  if (hasWon == '') {
                                    //Player's Move
                                    place(row, col, 1);
                                    if (judge(board.board, 'X', 'O') == 0) {
                                      hasWon = 'X';
                                      print('You won');
                                      return;
                                    }

                                    //Computer's Move
                                    int move = findBestMove(board.board);
                                    place(move ~/ 3, move % 3, 0);
                                    if (judge(board.board, 'O', 'X') == 0) {
                                      hasWon = 'O';
                                      print('Opponent won');
                                    }

                                    print(board.board);
                                  }
                                },
                                child: Container(
                                  height:size,
                                  width: size,
                                  color: Colors.transparent,
                                  child: Center(
                                      child: Text(
                                    board.board[row][col],
                                    style: TextStyle(
                                        color: (board.board[row][col] == 'X')
                                            ? Colors.red
                                            : Colors.green,
                                        fontSize: size / 5),
                                  )),
                                ));
                          }),
                    ),
                  ),
                ),
                FilledButton(
                    onPressed: restart, child: const Icon(Icons.restart_alt)),
                SizedBox(
                   width: size,
                   height:size/8,
                  child: Card(
                    color: const Color.fromARGB(255, 250, 169, 169),
                    elevation: 12,
                    child: Text(
                        'Games Played : $games\nX wins : $X_wins\nO wins : $O_wins\nDraws:${games-X_wins-O_wins}'),
                  ),
                )
              ],
            )));
  }
}
