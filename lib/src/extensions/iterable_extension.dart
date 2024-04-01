import 'dart:math';

final _random = Random();

extension IterableExtension on Iterable {
  String random() => elementAt(_random.nextInt(length));
}
