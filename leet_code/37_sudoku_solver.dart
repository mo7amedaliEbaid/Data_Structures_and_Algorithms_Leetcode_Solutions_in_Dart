// Write a program to solve a Sudoku puzzle by filling the empty cells.
//
// A sudoku solution must satisfy all of the following rules:
//
// Each of the digits 1-9 must occur exactly once in each row.
// Each of the digits 1-9 must occur exactly once in each column.
// Each of the digits 1-9 must occur exactly once in each of the 9 3x3 sub-boxes of the grid.
// The '.' character indicates empty cells.
//
//
//
// Example 1:
//
//
// Input: board = [["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]
// Output: [["5","3","4","6","7","8","9","1","2"],["6","7","2","1","9","5","3","4","8"],["1","9","8","3","4","2","5","6","7"],["8","5","9","7","6","1","4","2","3"],["4","2","6","8","5","3","7","9","1"],["7","1","3","9","2","4","8","5","6"],["9","6","1","5","3","7","2","8","4"],["2","8","7","4","1","9","6","3","5"],["3","4","5","2","8","6","1","7","9"]]


class Solution {
  void solveSudoku(List<List<String>> board) {
    if (board == null || board.length == 0) return;
    solve(board);
  }

  bool solve(List<List<String>> board) {
    for (int row = 0; row < board.length; row++) {
      for (int col = 0; col < board[0].length; col++) {
        if (board[row][col] == '.') {
          for (int num = 1; num <= 9; num++) {
            if (isValid(board, row, col, num.toString())) {
              board[row][col] = num.toString();
              if (solve(board)) {
                return true;
              } else {
                board[row][col] = '.';
              }
            }
          }
          return false;
        }
      }
    }
    return true;
  }

  bool isValid(List<List<String>> board, int row, int col, String num) {
    for (int i = 0; i < 9; i++) {
      if (board[row][i] == num) return false;
      if (board[i][col] == num) return false;
      if (board[3 * (row ~/ 3) + i ~/ 3][3 * (col ~/ 3) + i % 3] == num) return false;
    }
    return true;
  }
}

void main() {
  List<List<String>> board = [
    ["5", "3", ".", ".", "7", ".", ".", ".", "."],
    ["6", ".", ".", "1", "9", "5", ".", ".", "."],
    [".", "9", "8", ".", ".", ".", ".", "6", "."],
    ["8", ".", ".", ".", "6", ".", ".", ".", "3"],
    ["4", ".", ".", "8", ".", "3", ".", ".", "1"],
    ["7", ".", ".", ".", "2", ".", ".", ".", "6"],
    [".", "6", ".", ".", ".", ".", "2", "8", "."],
    [".", ".", ".", "4", "1", "9", ".", ".", "5"],
    [".", ".", ".", ".", "8", ".", ".", "7", "9"]
  ];

  Solution().solveSudoku(board);

  // Print solved Sudoku board
  for (int i = 0; i < 9; i++) {
    print(board[i]);
  }
}
