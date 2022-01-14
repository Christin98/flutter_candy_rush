import 'package:flutter_candy_rush/bloc/bloc_provider.dart';

class GameBloc implements BlocBase {
  // Max number of tiles per row (and per column)
  static double kMaxTilesPerRowAndColumn = 12.0;
  static double kMaxTilesSize = 28.0;

//
// Controller that emits a boolean value to trigger the display of the tiles
// at game load is ready.  This is done as soon as this BLoC receives the
// dimensions/position of the board as well as the dimensions of a tile
//

//
// Controller aimed at processing the Objective events
//

//
// Controller that emits a boolean value to notify that a game is over
// the boolean value indicates whether the game is won (=true) or lost (=false)
//

//
// Controller that emits the number of moves left for the game
//

//
// List of all level definitions
//

  int _maxLevel = 0;
  int _levelNumber = 0;
  int get levelNumber => _levelNumber;
  int get numberOfLevels => _maxLevel;

//
// The Controller for the Game being played
//

//
// Constructor
//
  GameBloc() {

  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

}