import 'dart:async';

import 'package:coffee_beanventory/tutorial/klodike/components/foundation.dart';
import 'package:coffee_beanventory/tutorial/klodike/components/pile.dart';
import 'package:coffee_beanventory/tutorial/klodike/components/stock.dart';
import 'package:coffee_beanventory/tutorial/klodike/components/waste.dart';
import 'package:flame/experimental.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/widgets.dart';

class KlondikeGame extends FlameGame {
  static const double cardWidth = 1000;
  static const double cardHeight = 1400;
  static const double cardGap = 175;
  static const double cardRadius = 100;
  static final Vector2 cardSize = Vector2(cardWidth, cardHeight);

  @override
  FutureOr<void> onLoad() async {
    await Flame.images.load('klondike-sprites.png');
    final stock = Stock()
      ..size = cardSize
      ..position = Vector2(
        cardGap,
        cardGap,
      );

    final waste = Waste()
      ..size = cardSize
      ..position = Vector2(
        cardWidth + 2 * cardGap,
        cardGap,
      );

    final foundations = List.generate(
      4,
      (i) => Foundation()
        ..size = cardSize
        ..position = Vector2(
          (i + 3) * (cardWidth + cardGap) + cardGap,
          cardGap,
        ),
    );

    final piles = List.generate(
      7,
      (i) => Pile()
        ..size = cardSize
        ..position = Vector2(
          cardGap + i * (cardWidth + cardGap),
          cardHeight + 2 * cardGap,
        ),
    );

    final world = World()
      ..add(stock)
      ..add(waste)
      ..addAll(foundations)
      ..addAll(piles);
    add(world);

    final camera = CameraComponent(world: world)
      ..viewfinder.visibleGameSize = Vector2(
        cardWidth * 7 + cardGap * 8,
        4 * cardHeight + 3 * cardGap,
      )
      ..viewfinder.position = Vector2(
        cardWidth * 3.5 + cardGap * 4,
        0,
      )
      ..viewfinder.anchor = Anchor.topCenter;
    add(camera);
  }

  Sprite klondikeSprite(double x, double y, double width, double height) {
    return Sprite(
      Flame.images.fromCache('klondike-sprites.png'),
      srcPosition: Vector2(x, y),
      srcSize: Vector2(width, height),
    );
  }
}
