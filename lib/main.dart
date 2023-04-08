import 'package:coffee_beanventory/ui/component/ball_generator.dart';
import 'package:coffee_beanventory/ui/top_page/top_page.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const RootPage());
}

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Income life',
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          // color: AppColors.dark,
          centerTitle: true,
          elevation: 0,
        ),
      ),
      home: const TopPage(),
      // navigatorKey: GetIt.I<GlobalKey<NavigatorState>>(),
      // localizationsDelegates: const [
      //   S.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      // supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
    );
  }
}

class Forge2DExample extends Forge2DGame with HasTappables {
  Forge2DExample()
      : _generator = const BallGenerator(),
        super(
          gravity: Vector2(0, 10),
          zoom: 5,
        );

  final BallGenerator _generator;

  static const double _widthWorld = 60;
  static const double _topWorld = 0;
  static const double _bottomWorld = 300;

  @override
  Color backgroundColor() => Colors.transparent;

  @override
  Future<void> onLoad() async {
    _generator.generateBalls(100).forEach(add);
    createBoundaries().forEach(add);
    return super.onLoad();
  }

  List<Component> createBoundaries() {
    final topLeft = screenToWorld(Vector2(_widthWorld, _topWorld));
    final bottomRight = screenToWorld(
      Vector2(
        camera.viewport.effectiveSize.x - _widthWorld,
        camera.viewport.effectiveSize.y - _bottomWorld,
      ),
    );
    final topRight = screenToWorld(Vector2(camera.viewport.effectiveSize.x - _widthWorld, _topWorld));
    final bottomLeft = screenToWorld(Vector2(_widthWorld, camera.viewport.effectiveSize.y - _bottomWorld));

    return [
      Wall(topRight, bottomRight),
      Wall(bottomLeft, bottomRight),
      Wall(topLeft, bottomLeft),
    ];
  }

  Future<void> addBalls(int balls) async {
    _generator.generateBalls(balls).forEach(add);
  }
}

class Wall extends BodyComponent {
  Wall(this._start, this._end)
      : super(
        // paint: Paint()..color = Colors.transparent,
        );
  final Vector2 _start;
  final Vector2 _end;

  @override
  Body createBody() {
    final shape = EdgeShape()..set(_start, _end);
    final fixtureDef = FixtureDef(shape, friction: 0.3);
    final bodyDef = BodyDef(
      userData: this,
      position: Vector2.zero(),
    );

    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }
}
