import 'package:flutter_test/flutter_test.dart';

import 'sample_test.dart';

void main() {
  group('Counter Test', () {
    test('Counter value should be starting 0', () {
      final counter = Counter();

      expect(counter.value, 0);
    });
    test('Counter value should be increment', () {
      final counter = Counter()..increment();

      expect(counter.value, 1);
    });
    test('Counter value should be decrement', () {
      final counter = Counter()..decrement();

      expect(counter.value, -1);
    });
  });
}
