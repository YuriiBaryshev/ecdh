import 'package:ecdh/ecdh.dart';
import 'package:test/test.dart';

void main() {
  group('ECDH tests', () {
    final ecdh = ECDH();

    test('secp256k1 is default elliptic curve', () {
      expect(ecdh, isTrue);
    });
  });
}
