import 'package:readable_uid/src/words/adjectives.dart';
import 'package:readable_uid/src/words/animals.dart';
import 'package:readable_uid/src/words/nouns.dart';
import 'package:readable_uid/src/words/verbs.dart';

/// Generates a summary line and formula for the chance of generating the same readable uid
void main() {
  /// ((adjective + verb) * noun * animal) * chanceToReverse

  final adjectives = Adjectives.values;
  final nouns = Nouns.values;
  final animals = Animals.values;
  final verbs = Verbs.values;
  const chanceToReverse = 2;

  final total =
      ((adjectives.length + verbs.length) * nouns.length * animals.length) *
          chanceToReverse;
  final chance = 1 / total;
  final summary =
      'Generates a readable UID using a combination of words and phrases.\n\n'
      '$chance% chance of generating the same readable uid\n\n'
      '(${adjectives.length} + ${verbs.length}) * ${nouns.length} * ${animals.length} * $chanceToReverse = $total\n'
      '1 / $total = $chance';
  print(summary);
}
