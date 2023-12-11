// class Gameboard{
//   //This is probably the most i have learned in  a sinle day 
//       //Making a singleton class for a the gameboard
//   static Gameboard board;//current instance  
//   Gameboard._(); //constructor
  
// }
// tic_tac_toe_board.dart

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

//This is a singleton class implementation of gameboard  we will be using 

//class Board
class Board {
  static final Board _instance = Board._internal();//Board
//Private constructor
  factory Board() {
    return _instance;
  }

  Board._internal();
  //Main 2d list  that would represent Game board
  List<List<String>> board = List.generate(3, (_) => List.filled(3, ''));
  
}
