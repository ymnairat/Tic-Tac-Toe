import 'dart:io'; // This library use to access input/output functionality.

class TicTacToe {
  // List to represent the game board.
  late List<String> board;
  // Current player, initialized to 'X'.
  late String currentPlayer;
  // Flag to indicate if the game has been over.
  late bool gameOver;

  TicTacToe() {
    board = List.filled(9, ' '); // Initializes the board.
    currentPlayer = 'X'; // Initializes the player.
    gameOver = false; // Initializes the game state.
  }

  // Method to print the current state of the game board.
  void printBoard() {
    print(' ${board[0]} | ${board[1]} | ${board[2]} ');
    print('ــــــــــ');
    print(' ${board[3]} | ${board[4]} | ${board[5]} ');
    print('ــــــــــ');
    print(' ${board[6]} | ${board[7]} | ${board[8]} ');
  }

  // Method to check if a move is valid.
  bool isValidMove(int position) {
    return position >= 1 && position <= 9 && board[position - 1] == ' ';
  }

  // Method to make a move on the board.
  void makeMove(int position) {
    if (isValidMove(position)) {
      board[position - 1] = currentPlayer;
      printBoard();
      if (checkWin()) {
        print('$currentPlayer wins!');
        gameOver = true;
      } else if (checkDraw()) {
        print('It\'s a draw!');
        gameOver = true;
      } else {
        switchPlayer();
      }
    } else {
      print('Invalid move. Please choose an empty cell (1-9).');
    }
  }

  // Method to check for a winning condition.
  bool checkWin() {
    for (var i = 0; i < 3; i++) {
      // Check rows.
      if (board[i * 3] != ' ' &&
          board[i * 3] == board[i * 3 + 1] &&
          board[i * 3 + 1] == board[i * 3 + 2]) {
        return true;
      }
      // Check columns.
      if (board[i] != ' ' &&
          board[i] == board[i + 3] &&
          board[i + 3] == board[i + 6]) {
        return true;
      }
    }
    // Check diagonals.
    if (board[0] != ' ' && board[0] == board[4] && board[4] == board[8]) {
      return true;
    }
    if (board[2] != ' ' && board[2] == board[4] && board[4] == board[6]) {
      return true;
    }

    return false;
  }

  // Method to check for a draw condition.
  bool checkDraw() {
    if (!board.contains(' ')) {
      return true;
    }
    return false;
  }

  // Method to switch players.
  void switchPlayer() {
    currentPlayer = (currentPlayer == 'X') ? 'O' : 'X';
  }

  // Method to start the game loop.
  void startGame() {
    print('Welcome to Tic Tac Toe!');
    printBoard();
    while (!gameOver) {
      print('Player $currentPlayer, enter your move (1-9): ');
      try {
        var input = int.parse(stdin.readLineSync() ?? '');
        makeMove(input);
      } catch (FormatException) {
        // Handle the FormatException here.
        print('Invalid input format. Please enter a valid number from (1-9).');
      }
    }
    print('Do you want to play again? (yes/no)');
    var playAgain = stdin.readLineSync()?.toLowerCase();
    if (playAgain == 'yes') {
      resetGame();
      startGame();
    } else {
      print('Thanks for playing!');
    }
  }

  // Method to reset the game state.
  void resetGame() {
    board = List.filled(9, ' ');
    currentPlayer = 'X';
    gameOver = false;
  }
}

void main() {
  TicTacToe ticTacToe = TicTacToe();
  ticTacToe.startGame();
}