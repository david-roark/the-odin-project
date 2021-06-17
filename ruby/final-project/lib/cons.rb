# list pieces chess
PIECES_SYMBOL = {
  'bRook' => "♜", 'wRook' => "♖",
  'bKnight' => "♞", 'wKnight' => "♘",
  'bBishop' => "♝", 'wBishop' => "♗",
  'bQueen' => '♛', 'wQueen' => "♕",
  'bKing' => "♚", 'wKing' => "♔",
  'bPawn' => "♟︎", 'wPawn' => "♙"
}.freeze

# promt of console
PROMT = '>> '

# welcome message
WELCOME = <<-WELCOME
 .......................
| Welcome to Chess game |
| Let's play chess now  |
 ```````````````````````
WELCOME

# menu game
MENU = <<-MENU

|--------------------|
|        Menu        |
|--------------------|
|1 |New game         |
|2 |Continue         |
|3 |Help             |
|4 |Quit             |
|--------------------|
MENU

# goodbye message
GOODBYE = <<-GOODBYE
 .....................
|  See ya again! Bye  |
 `````````````````````
GOODBYE

# Help
HELP = <<-HELP
1. How to play
  - Position will look as same as '11', '74',...
  - If you type '74':
    + 7 is the number of row
    + 4 is the number of column

    __ | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8
    1  | ♜ | ♞ | ♝ | ♛ | ♚ | ♝ | ♞ | ♜
    2  | ♟ | ♟ | ♟ | ♟ | ♟ | ♟ | ♟ | ♟
    3  |   |   |   |   |   |   |   |
    4  |   |   |   |   |   |   |   |
    5  |   |   |   |   |   |   |   |
    6  |   |   |   |   |   |   |   |
    7  | ♙ | ♙ | ♙ |*♙*| ♙ | ♙ | ♙ | ♙
    8  | ♖ | ♘ | ♗ | ♕ | ♔ | ♗ | ♘ | ♖

    => You have picked the *♙* (white pawn)

  - Type 'exit' when you want to back to Menu
  - Type 'other piece' if you want to chose other chess piece

2. Rules
  - Visit https://www.chessvariants.com/d.chess/chess.html

3. Author
  Hello every one.

  I'm David Roark. I'm Vietnamese and I live in HoChiMinh city.
  I am so happy when you try to play my game.

  Thank you so much!!! Bye ya :D

HELP
