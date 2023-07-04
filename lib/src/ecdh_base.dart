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
}
