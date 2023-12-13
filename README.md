# Dart Tic-Tac-Toe Game

Welcome to the Dart Tic-Tac-Toe game! This console-based game allows two players to take turns making moves on a 3x3 grid until one player wins or the game ends in a draw.

## Prerequisites

Make sure you have Dart installed on your machine. If not, you can download it from [dart.dev](https://dart.dev/get-dart).

## Getting Started

1. Clone this repository to your local machine:

    ```bash
    git clone https://github.com/your-username/dart-tic-tac-toe.git
    ```

2. Navigate to the project directory:

    ```bash
    cd dart-tic-tac-toe
    ```

3. Run the Dart script:

    ```bash
    dart main.dart
    ```

## How to Play

- The game board is represented by a 3x3 grid, with each cell numbered from 1 to 9.

    ```
    1 | 2 | 3
    ---------
    4 | 5 | 6
    ---------
    7 | 8 | 9
    ```

- Players are represented by 'X' and 'O'.

- To make a move, enter the corresponding number of the cell where you want to place your marker.

- The game will validate your move, and if it's valid, the updated board will be displayed.

- The game will check for a winner or a draw after each move.

- The game will prompt you to play again after it concludes. Type 'yes' to restart or 'no' to exit.

## Example Gameplay

```plaintext
Welcome to Tic-Tac-Toe!

  |   |  
-----------
  |   |  
-----------
  |   |  

Player X, enter your move (1-9): 5

  |   |  
-----------
  | X |  
-----------
  |   |  

Player O, enter your move (1-9): 1

 O |   |  
-----------
  | X |  
-----------
  |   |  

...

Player X, enter your move (1-9): 3

 O |   | X
-----------
   | X |  
-----------
 X | O |  

Player X wins!

Do you want to play again? (yes/no)
yes