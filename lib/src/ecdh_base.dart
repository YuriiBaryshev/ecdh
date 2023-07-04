import 'package:elliptic/elliptic.dart';

import './ecdh_actor.dart';

/// Checks if you are awesome. Spoiler: you are.
class ECDH {
  late ECDHActor alice, bob;

  ///Simulate elliptic curve Diffie-Hellman protocol for two parties
  ECDH([EllipticCurve? ec]) {
    alice = ECDHActor(ec);
    bob = ECDHActor(ec);
  }
}
