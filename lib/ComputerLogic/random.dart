import 'dart:math';

import 'package:tic_tac_toe/GameInstance/board.dart';

int random(Board board) {
  //returns an empty  grid value position from top left
  List<int> Empty = [];
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      if (board.board[i][j].isEmpty) {
        Empty.add(i * 3 + j);
      }
    }
  }

  Random random = Random();
  int pos = 0;
  try {
    pos = random.nextInt(Empty.length);
  } catch (e) {
    print('Error No Empty Place in Grid');
    return 0;
  }
  return Empty[pos];
}
