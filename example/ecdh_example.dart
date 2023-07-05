import 'package:ecdh/ecdh.dart';
import 'package:elliptic_curves_facade/elliptic_curves_facade.dart';
import 'package:elliptic/elliptic.dart';

void main() {
  ECDHActor alice, bob, carl;
  EllipticCurve ec = getP256();
  //initialization and computing personal part of secret by each party
  alice = ECDHActor(ec);
  bob = ECDHActor(ec);
  carl = ECDHActor(ec);
  //generating G*secret points
  ECPoint fromAlice1 = alice.yieldPoint();
  ECPoint fromBob1 = bob.yieldPoint();
  ECPoint fromCarl1 = carl.yieldPoint();
  //Points' exchange round 1
  ECPoint fromAlice2 = alice.yieldPoint(fromCarl1);
  ECPoint fromBob2 = bob.yieldPoint(fromAlice1);
  ECPoint fromCarl2 = carl.yieldPoint(fromBob1);
  //Points' exchange round2
  alice.yieldPoint(fromCarl2);
  bob.yieldPoint(fromAlice2);
  carl.yieldPoint(fromBob2);
  //comparison of results
  print(alice.getMutualSecret() == bob.getMutualSecret());//true
  print(bob.getMutualSecret() == carl.getMutualSecret());//true
}
