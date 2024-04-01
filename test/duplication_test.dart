import 'package:readable_uid/src/readable_uid.dart';
import 'package:test/test.dart';

/// Tests the duplication potential of the UID generator.
void main() {
  test('UID duplication test', () {
    final readableUid = ReadableUid(preventCollision: true);
    final uids = <String>{};

    for (var i = 0; i < 1000000; i++) {
      final uid = readableUid.generate();
      expect(uids.contains(uid), isFalse, reason: 'UID "$uid" is duplicated');
      uids.add(uid);
    }
  });
}
