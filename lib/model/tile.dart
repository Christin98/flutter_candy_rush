// @dart=2.9
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_candy_rush/model/level.dart';

///
/// Tile
///
class Tile extends Object {
  TileType type;
  int row;
  int col;
  Level level;
  int depth;
  Widget _widget;
  double x;
  double y;
  bool visible;

  Tile({
    this.type,
    this.row = 0,
    this.col = 0,
    this.level,
    this.depth = 0,
    this.visible = true,
});

  @override
  int get hashCode => row * level.numberOfRows + col;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || other.hashCode == this.hashCode;
  }

  @override
  String toString() {
    return '[$row][$col] => ${describeEnum(type)}';
  }

  //
  // Builds the tile in terms of "decoration" ( = image )
  //
  void build({bool computePosition = true}) {
    if (depth > 0 && type != TileType.wall) {
      _widget = Stack(
        children: <Widget>[
          Opacity(
            opacity: 0.7,
            child: Transform.scale(
              scale: 0.8,
                child: _buildDecoration(),
            ),
          ),
          _buildDecoration('deco/ice_02.png'),
        ],
      );
    } else if (type == TileType.empty) {
      _widget = Container();
    } else {
      _widget = _buildDecoration();
    }

    if (computePosition) {
      setPosition();
    }
  }

  Widget _buildDecoration([String path = ""]) {
    String imageAsset = path;
    if (imageAsset == "") {
      switch(type) {
        case TileType.wall:
          imageAsset = "deco/wall.png";
          break;

        case TileType.bomb:
          imageAsset = "bombs/mine.png";
          break;

        case TileType.flare:
          imageAsset = "bombs/tnt.png";
          break;

        case TileType.wrapped:
          imageAsset = "tiles/multicolor.png";
          break;

        case TileType.fireball:
          imageAsset = "bombs/rocket.png";
          break;

        default:
          try {
            imageAsset = "tiles/${describeEnum(type)}.png";
          } catch(e) {
            return Container();
          }
          break;
      }
    }
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/$imageAsset'),
          fit: BoxFit.contain,
        )
      ),
    );
  }

  //
  // Returns the position of this tile in the checkerboard
  // based on its position in the grid (row, col) and
  // the dimensions of the board and a tile
  //
  void setPosition() {
    double bottom = level.boardTop + (level.numberOfRows - 1) * level.tileHeight;
    x = level.boardLeft + col * level.tileWidth;
    y = bottom - row * level.tileHeight;
  }
//
// Generate a tile to be used during the swap animations
//

//
// Swaps this tile (row, col) with the ones of another Tile
//

//
// Returns the Widget to be used to render the Tile
//


//
// Can the Tile move?
//

// ################  HELPERS  ######################
//
// Generate a random tile
//



}

//
// Types of tiles
//

enum TileType {
  forbidden,
  empty,
  red,
  green,
  blue,
  orange,
  purple,
  yellow,
  wall,
  bomb,
  flare,
  wrapped,
  fireball,
  last,
}