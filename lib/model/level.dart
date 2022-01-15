import 'package:flutter_candy_rush/helpers/array_2d.dart';
import 'package:quiver/iterables.dart';

///
/// Level
///
/// Definition of a level in terms of:
///  - grid template
///  - maximum number of moves
///  - number of columns
///  - number of rows
///  - list of objectives
///
class Level extends Object {
  late final int _index;
  late Array2d grid;
  late final int _rows;
  late final int _cols;
  // List<>
  late final int _maxMoves;
  late int _movesLeft;

  //
  // Variables that depend on the physical layout of the device
  //

  double tileWidth = 0.0;
  double tileHeight = 0.0;
  double boardLeft = 0.0;
  double boardTop = 0.0;

  Level.fromJson(Map<String, dynamic> json)
      : _index = json["level"],
        _rows = json["rows"],
        _cols = json["cols"],
        _maxMoves = json["moves"]
      {
        // Initialize the grid to the dimensions
        grid = Array2d(_rows, _cols,);

        // Populate the grid from the definition
        //
        // Trick
        //  As the definition in the JSON file defines the 
        //  rows (top-down) and also because we are recording
        //  the grid (bottom-up), we need to reverse the
        //  definition from the JSON file.
        //
        enumerate((json["grid"] as List).reversed).forEach((row) { 
          enumerate(row.value.split(',')).forEach((cell) {
            grid[row.index][cell.index] = cell.value;
          });
        });

        // Retrieve the objectives

        // First-time initialization
      }
      @override
      String toString() {
    return "level: $index \n" + dumpArray2d(grid);
  }

  int get numberOfRows => _rows;
  int get numberOfCols => _cols;
  int get index => _index;
  int get maxMoves => _maxMoves;
  int get movesLeft => _movesLeft;
  // List

//
// Reset the objectives
//


//
// Decrement the number of moves left
//
 int decrementMove() {
   return (--_movesLeft).clamp(0, _maxMoves);
 }
}