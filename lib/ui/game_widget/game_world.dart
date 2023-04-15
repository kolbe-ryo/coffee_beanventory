// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

// Project imports:
import 'package:coffee_beanventory/constant/constants.dart';
import 'package:coffee_beanventory/ui/game_widget/ball_generator.dart';
import 'package:coffee_beanventory/ui/game_widget/wall.dart';

class GameWorld extends Forge2DGame with HasTappables {
  GameWorld(this._mediaQuery)
      : _generator = const BallGenerator(),
        super(zoom: 5);

  final BallGenerator _generator;
  final Size _mediaQuery;
  late Component _bottomWall;

  @override
  Color backgroundColor() => Colors.transparent;

  // Getter for coordinates for Walls
  double get _paddingWidth => baseWidthRate * _mediaQuery.width;

  double get _bottomCoordinateY => _mediaQuery.width * aspectRateOfFlame - _paddingWidth;

  Vector2 get _topLeftCoordinateVector => screenToWorld(
        Vector2(
          _paddingWidth,
          topWorld,
        ),
      );

  Vector2 get _topRightCoordinateVector => screenToWorld(
        Vector2(
          camera.viewport.effectiveSize.x - _paddingWidth,
          topWorld,
        ),
      );

  Vector2 get _bottomLeftCoordinateVector => screenToWorld(
        Vector2(
          _paddingWidth,
          _bottomCoordinateY,
        ),
      );

  Vector2 get _bottomRightCoordinateVector => screenToWorld(
        Vector2(
          camera.viewport.effectiveSize.x - _paddingWidth,
          _bottomCoordinateY,
        ),
      );

  Vector2 get _bottomLeftCenterCoordinateVector => screenToWorld(
        Vector2(
          _mediaQuery.width / 3,
          _bottomCoordinateY,
        ),
      );

  Vector2 get _bottomRightCenterCoordinateVector => screenToWorld(
        Vector2(
          _mediaQuery.width * 2 / 3,
          _bottomCoordinateY,
        ),
      );

  // Initial method
  @override
  Future<void> onLoad() async {
    _generator.generateBalls(30).forEach(add);
    createBoundaries().forEach(add);
    return super.onLoad();
  }

  // Create initial boundaries
  List<Component> createBoundaries() {
    _bottomWall = Wall(_bottomLeftCoordinateVector, _bottomRightCoordinateVector);

    return [
      // Left Wall
      Wall(_topLeftCoordinateVector, _bottomLeftCoordinateVector),
      // Right Wall
      Wall(_topRightCoordinateVector, _bottomRightCoordinateVector),
      // TODO: Left Bottom Wall
      // TODO: RIght Bottom Wall

      // Center Bottom Wall
      _bottomWall,
    ];
  }

  // Add bottom layer
  Future<void> onCreate() async {
    _bottomWall = Wall(_bottomLeftCoordinateVector, _bottomRightCoordinateVector);
    add(_bottomWall);
  }

  // Remove bottom layer
  @override
  Future<void> onRemove() async {
    _bottomWall.onRemove();
  }

  // TODO: 追加時にstateとローカルを更新する
  Future<void> addBalls(int balls) async {
    _generator.generateBalls(balls).forEach(add);
  }
}
