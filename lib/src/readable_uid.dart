import 'dart:math';

import 'package:readable_uid/src/extensions/iterable_extension.dart';
import 'package:readable_uid/src/words/adjectives.dart';
import 'package:readable_uid/src/words/animals.dart';
import 'package:readable_uid/src/words/nouns.dart';
import 'package:readable_uid/src/words/verbs.dart';

class ReadableUid {
  ReadableUid({
    this.preventCollision = false,
  });

  final bool preventCollision;

  final _random = Random();
  var _index = 0;

  String generate() {
    if (preventCollision) {
      return _generateAndPreventCollision();
    } else {
      return _generateRandom();
    }
  }

  /// Generates a readable UID using a combination of words and phrases.
  ///
  /// 8.579764180033654e-9% chance of generating the same readable uid
  ///
  /// (359 + 395) * 295 * 262 * 2 = 116553320
  /// 1 / 116553320 = 8.579764180033654e-9
  String _generateRandom() {
    final animal = Animals.values.random();
    final noun = Nouns.values.random();

    String phrase;

    /// (adjective OR verb) noun animal
    if (_random.nextBool()) {
      final adjective = Adjectives.values.random();
      phrase = '$adjective $noun $animal';
    } else {
      final verb = Verbs.values.random();
      phrase = '$verb $noun $animal';
    }

    /// 50% chance to reverse the order
    if (_random.nextBool()) {
      phrase = phrase.split(' ').reversed.join(' ');
    }

    return phrase;
  }

  String _generateAndPreventCollision() {
    final animal = Animals.values[_index % Animals.values.length];
    final noun = Nouns.values[_index % Nouns.values.length];

    String phrase;

    /// (adjective OR verb) noun animal
    if (_random.nextBool()) {
      final adjective = Adjectives.values[_index % Adjectives.values.length];
      phrase = '$adjective $noun $animal';
    } else {
      final verb = Verbs.values[_index % Verbs.values.length];
      phrase = '$verb $noun $animal';
    }

    /// 50% chance to reverse the order
    if (_random.nextBool()) {
      phrase = phrase.split(' ').reversed.join(' ');
    }

    _index++;

    return phrase;
  }
}
