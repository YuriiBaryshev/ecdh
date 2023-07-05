import 'package:elliptic/elliptic.dart';
import 'package:elliptic_curves_facade/elliptic_curves_facade.dart';

import './ecdh_actor.dart';

/// Checks if you are awesome. Spoiler: you are.
class ECDH {
  late ECDHActor alice, bob;

  ///Simulate elliptic curve Diffie-Hellman protocol for two parties
  ECDH([EllipticCurve? ec]) {
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
    return alice.yieldPoint();
  }

  ///Create Bob's G*_secret point
  ECPoint bobCreatesPointForExchange() {
    return bob.yieldPoint();
  }

  ///Compute mutual secret for Alice
  ECPoint aliceComputesMutualSecret(ECPoint pointFromBob) {
    return alice.yieldPoint(pointFromBob);
  }

  ///Compute mutual secret for Bob
  ECPoint bobComputesMutualSecret(ECPoint pointFromAlice) {
    return bob.yieldPoint(pointFromAlice);
  }

  ///Integration method to call them all to one's will ;)
  void executeDH() {
    generateSecrets();
    ECPoint fromAlice = aliceCreatesPointForExchange();
    ECPoint fromBob = bobCreatesPointForExchange();
    ECPoint resultOfAlice = aliceComputesMutualSecret(fromBob);
    ECPoint resultOfBob = bobComputesMutualSecret(fromAlice);
    if(resultOfAlice != resultOfBob) {
      throw Exception("Something went wrong and ECDH finished unexpectedly");
    }
  }
}
