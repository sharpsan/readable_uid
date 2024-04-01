import 'dart:io';
import 'dart:convert';

//TODO: only read / write files once instead of multiple times

Future<void> removeDuplicatesAndSave(String path) async {
  final file = File(path);
  final contents = await file.readAsString();
  final List<dynamic> data = jsonDecode(contents);
  final uniqueData = data.toSet().toList();
  final json = jsonEncode(uniqueData);
  await file.writeAsString(json);
}

Future<void> convertToLowerCaseAndSave(String path) async {
  final file = File(path);
  final contents = await file.readAsString();
  final List<dynamic> data = jsonDecode(contents);
  final lowerCaseData = data.map((e) => e.toString().toLowerCase()).toList();
  final json = jsonEncode(lowerCaseData);
  await file.writeAsString(json);
}

/// sort alphabetically
Future<void> sortAndSave(String path) async {
  final file = File(path);
  final contents = await file.readAsString();
  final List<dynamic> data = jsonDecode(contents);
  data.sort();
  final json = jsonEncode(data);
  await file.writeAsString(json);
}

void main() {
  final files = Directory('assets/json').listSync();

  for (final file in files) {
    if (file is File && file.path.endsWith('.json')) {
      removeDuplicatesAndSave(file.path);
      convertToLowerCaseAndSave(file.path);
      sortAndSave(file.path);
    }
  }
}
