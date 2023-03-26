import 'package:coffee_beanventory/tutorial/klodike/components/card.dart';
import 'package:coffee_beanventory/tutorial/klodike/klodike.dart';
import 'package:flame/components.dart';

class WastePile extends PositionComponent {
  WastePile({super.position}) : super(size: KlondikeGame.cardSize);

  final List<Card> _cards = [];

  void acquireCard(Card card) {
    assert(card.isFaceUp);
    card
      ..position = position
      ..priority = _cards.length;
    _cards.add(card);
  }
}
