# Readable UID

Readable UID is a Dart library for generating readable, unique identifiers (UIDs). It uses a combination of words to create UIDs that are easy to read and remember, while still being unique.

### Usage

Here's a simple example of how to use Readable UID:

```dart
import 'package:readable_uid/readable_uid.dart';

void main() {
  final uid = ReadableUid().generate();
  print(uid);  // Outputs a UID like "fancy doorbell penguin"
}
```
