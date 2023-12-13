import 'dart:io'; // This library use to access input/output functionality.

// Class representing the Tic-Tac-Toe game
class TicTacToe {
  // List to represent the game board
  late List<String> board;
  // Current player, initialized to 'X'
  late String currentPlayer;
  // Flag to indicate if the game has been won
  late bool gameWon;

  // Constructor initializes the board, current player, and game state
  TicTacToe() {
    board = List.filled(9, ' ');
    currentPlayer = 'X';
    gameWon = false;
  }

  // Method to print the current state of the game board
  void printBoard() {
    print(' ${board[0]} | ${board[1]} | ${board[2]} ');
    print('ــــــــــ');
    print(' ${board[3]} | ${board[4]} | ${board[5]} ');
    print('ــــــــــ');
    print(' ${board[6]} | ${board[7]} | ${board[8]} ');
  }

  // Method to check if a move is valid
  bool isValidMove(int position) {
    return position >= 1 && position <= 9 && board[position - 1] == ' ';
  }

  // Method to make a move on the board
  void makeMove(int position) {
    if (isValidMove(position)) {
      board[position - 1] = currentPlayer;
      printBoard();
      checkWin();
      checkDraw();
      switchPlayer();
    } else {
      print('Invalid move. Please choose an empty cell (1-9).');
    }
  }

  // Method to check for a winning condition
  void checkWin() {
    for (var i = 0; i < 3; i++) {
      // Check rows
      if (board[i * 3] != ' ' &&
          board[i * 3] == board[i * 3 + 1] &&
          board[i * 3 + 1] == board[i * 3 + 2]) {
        print('$currentPlayer wins!');
        gameWon = true;
      }
      // Check columns
      if (board[i] != ' ' &&
          board[i] == board[i + 3] &&
          board[i + 3] == board[i + 6]) {
        print('$currentPlayer wins!');
        gameWon = true;
      }
    }
    // Check diagonals
    if (board[0] != ' ' && board[0] == board[4] && board[4] == board[8]) {
      print('$currentPlayer wins!');
      gameWon = true;
    }
    if (board[2] != ' ' && board[2] == board[4] && board[4] == board[6]) {
      print('$currentPlayer wins!');
      gameWon = true;
    }
  }

  // Method to check for a draw condition
  void checkDraw() {
    if (!board.contains(' ')) {
      print('It\'s a draw!');
      gameWon = true;
    }
  }

  // Method to switch players
  void switchPlayer() {
    currentPlayer = (currentPlayer == 'X') ? 'O' : 'X';
  }

  // Method to start the game loop
  void startGame() {
    print('Welcome to Tic-Tac-Toe!');
    printBoard();
    while (!gameWon) {
      print('Player $currentPlayer, enter your move (1-9): ');
      var input = int.tryParse(stdin.readLineSync() ?? '');
      if (input != null) {
        makeMove(input);
      } else {
        print('Invalid input. Please enter a number.');
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

  // Method to reset the game state
  void resetGame() {
    board = List.filled(9, ' ');
    currentPlayer = 'X';
    gameWon = false;
  }
}

// Main function that creates an instance of the game and starts it
void main() {
  TicTacToe ticTacToe = TicTacToe();
  ticTacToe.startGame();
}
