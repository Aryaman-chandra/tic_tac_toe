import 'dart:math';
import 'dart:io';

void printBoard(List<List<String>> board) {
  for (int row = 0; row < 3; row++) {
    for (int col = 0; col < 3; col++) {
      stdout.write('${board[row][col]} ');
    }
    print('');
  }
  print('');
}

bool isBoardFull(List<List<String>> board) {
  for (int row = 0; row < 3; row++) {
    for (int col = 0; col < 3; col++) {
      if (board[row][col] == '') {
        return false;
      }
    }
  }
  return true;
}

bool isWinner(List<List<String>> board, String player) {
  for (int i = 0; i < 3; i++) {
    if ((board[i][0] == player &&
            board[i][1] == player &&
            board[i][2] == player) ||
        (board[0][i] == player &&
            board[1][i] == player &&
            board[2][i] == player)) {
      return true;
    }
  }

  if ((board[0][0] == player &&
          board[1][1] == player &&
          board[2][2] == player) ||
      (board[0][2] == player &&
          board[1][1] == player &&
          board[2][0] == player)) {
    return true;
  }

  return false;
}

int evaluate(List<List<String>> board) {
  if (isWinner(board, 'O')) {
    return 10;
  } else if (isWinner(board, 'X')) {
    return -10;
  } else {
    return 0;
  }
}

bool isMoveValid(List<List<String>> board, int row, int col) {
  return board[row][col] == '';
}

int minimax(List<List<String>> board, int depth, bool isMaximizing, int alpha,
    int beta) {
  int score = evaluate(board);

  if (score == 10 || score == -10) {
    return score;
  }

  if (isBoardFull(board)) {
    return 0;
  }

  if (isMaximizing) {
    int best = -1000;

    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (isMoveValid(board, i, j)) {
          board[i][j] = 'O';
          best =
              max(best, minimax(board, depth + 1, !isMaximizing, alpha, beta));
          board[i][j] = '';

          alpha = max(alpha, best);
          if (beta <= alpha) {
            break; // Beta cutoff
          }
        }
      }
    }
    return best;
  } else {
    int best = 1000;

    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (isMoveValid(board, i, j)) {
          board[i][j] = 'X';
          best =
              min(best, minimax(board, depth + 1, !isMaximizing, alpha, beta));
          board[i][j] = '';

          beta = min(beta, best);
          if (beta <= alpha) {
            break; // Alpha cutoff
          }
        }
      }
    }
    return best;
  }
}

int findBestMove(List<List<String>> board) {
  int bestVal = -1000;
  int bestMove = -1;

  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      if (isMoveValid(board, i, j)) {
        board[i][j] = 'O';
        int moveVal = minimax(board, 0, false, -1000, 1000);
        board[i][j] = '';

        if (moveVal > bestVal) {
          bestMove = 3 * i + j;
          bestVal = moveVal;
        }
      }
    }
  }

  return bestMove;
}
