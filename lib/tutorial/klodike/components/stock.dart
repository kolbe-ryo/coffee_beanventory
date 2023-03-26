import 'package:coffee_beanventory/tutorial/klodike/components/card.dart';
import 'package:coffee_beanventory/tutorial/klodike/klodike.dart';
import 'package:flame/components.dart';

class StockPile extends PositionComponent {
  StockPile({super.position}) : super(size: KlondikeGame.cardSize);

  /// Which cards are currently placed onto this pile. The first card in the
  /// list is at the bottom, the last card is on top.
  final List<Card> _cards = [];

  void acquireCard(Card card) {
    assert(!card.isFaceUp);
    card
      ..position = position
      ..priority = _cards.length;
    _cards.add(card);
  }
}
