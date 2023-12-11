int judge(List<List<String>> board, String player1, String player2) {
  int t = -1;

  for (int i = 0; i < 3; i++) {
    if ((board[i][0] == player1 &&
            board[i][1] == player1 &&
            board[i][2] == player1) ||
        (board[0][i] == player1 &&
            board[1][i] == player1 &&
            board[2][i] == player1)) t = 0;
    if ((board[i][0] == player2 &&
            board[i][1] == player2 &&
            board[i][2] == player2) ||
        (board[0][i] == player2 &&
            board[1][i] == player2 &&
            board[2][i] == player2)) t = 1;
  }
  if ((board[0][0] == player1 &&
          board[1][1] == player1 &&
          board[2][2] == player1) ||
      (board[0][2] == player1 &&
          board[1][1] == player1 &&
          board[2][0] == player1)) {
    t = 0;
  }
  if ((board[0][0] == player2 &&
          board[1][1] == player2 &&
          board[2][2] == player2) ||
      (board[0][2] == player2 &&
          board[1][1] == player2 &&
          board[2][0] == player2)) {
    t = 1;
  }
  return t;
}
