import 'package:elliptic/elliptic.dart';
import 'package:elliptic_curves_facade/elliptic_curves_facade.dart';

import './ecdh_actor.dart';

/// Checks if you are awesome. Spoiler: you are.
class ECDH {
  late ECDHActor alice, bob;
  late EllipticCurve _ec;

  ///Simulate elliptic curve Diffie-Hellman protocol for two parties
  ECDH([EllipticCurve? ec]) {
    _ec = ec ?? getSecp256k1() as EllipticCurve;
    alice = ECDHActor(ec);
    bob = ECDHActor(ec);
  }

  ///Generate secret values
  void generateSecrets() {
    alice.generateSecret();
    bob.generateSecret();
  }
  
  ///Create Alice's G*_secret point
  ECPoint aliceCreatesPointForExchange() {
    return alice.yieldPoint(ECPoint(_ec.G.X, _ec.G.Y));
  }

  ///Create Bob's G*_secret point
  ECPoint bobCreatesPointForExchange() {
    return bob.yieldPoint(ECPoint(_ec.G.X, _ec.G.Y));
  }

  ///Compute mutual secret for Alice
  ECPoint aliceComputesMutualSecret(ECPoint pointFromBob) {
    return alice.yieldPoint(pointFromBob);
  }

  ///Compute mutual secret for Bob
  ECPoint bobComputesMutualSecret(ECPoint pointFromAlice) {
    return bob.yieldPoint(pointFromAlice);
  }
}
