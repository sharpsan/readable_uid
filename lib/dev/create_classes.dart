import 'dart:io';
import 'dart:convert';
import 'dart:math';
import 'package:path/path.dart' as p;
import 'package:recase/recase.dart';

Future<void> generateClass(String path) async {
  final file = File(path);
  final contents = await file.readAsString();
  final List data = jsonDecode(contents);

  // Create a new Random instance
  final random = Random();

  // Shuffle the data
  data.shuffle(random);

  final reCase = ReCase(p.basenameWithoutExtension(path));
  final className = reCase.pascalCase;
  final classDefinition = 'class $className {\n'
      '  static const values = ${jsonEncode(data)};\n'
      '}\n';

  final outputPath = p.join('lib', 'src', 'words', '${reCase.snakeCase}.dart');
  final outputFile = File(outputPath);
  await outputFile.create(
    recursive: true,
  ); // This will create the directory if it doesn't exist
  await outputFile.writeAsString(classDefinition);

  // Run dartfmt on the file
  await Process.run('dart', ['format', outputPath]);
}

void main() {
  /// load all json files under assets/json
  final files = Directory('assets/json').listSync();

  for (final file in files) {
    if (file is File && file.path.endsWith('.json')) {
      generateClass(file.path);
    }
  }
}
