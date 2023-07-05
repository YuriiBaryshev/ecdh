import 'package:ecdh/ecdh.dart';
import 'package:elliptic/elliptic.dart';
import 'package:elliptic_curves_facade/elliptic_curves_facade.dart';
import 'package:test/test.dart';

void main() {
  group('ECDH tests', () {
    final ecdh = ECDH();

    test('secp256k1 is default elliptic curve', () {
      expect(ecdh.alice.intermediatePoint, ECPoint(getSecp256k1().G.X, getSecp256k1().G.Y));
      expect(ecdh.bob.intermediatePoint, ECPoint(getSecp256k1().G.X, getSecp256k1().G.Y));
    });
  });
}
