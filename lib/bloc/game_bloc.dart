import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_candy_rush/bloc/bloc_provider.dart';
import 'package:flutter_candy_rush/model/level.dart';
import 'package:quiver/iterables.dart';

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
  List<Level> _levels = <Level>[];
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
    // Load all levels definitions
    _loadLevels();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

//
// The user wants to select a level.
// We validate the level number and emit the requested Level
//
// We use the [async] keyword to allow the caller to use a Future
//
//  e.g.  bloc.setLevel(1).then(() => )
//
 Future<Level> setLevel(int levelIndex) async {
    _levelNumber = (levelIndex - 1).clamp(0, _maxLevel);
    return _levels[_levelNumber];
 }

//
// Load the levels definitions from assets
//
  
  _loadLevels() async {
    String jsonContent = await rootBundle.loadString("assets/levels.json");
    Map<dynamic, dynamic> list = json.decode(jsonContent);
    enumerate(list["levels"] as List).forEach((levelItem) {
      _levels.add(Level.fromJson(levelItem.value));
      _maxLevel++;
    });
  }
 

}