import 'dart:math';
import 'package:elliptic_curves_facade/elliptic_curves_facade.dart';
import 'package:elliptic/elliptic.dart';

///Represent actor/party of ECDH protocol
class ECDHActor {
  late BigInt _secret;
  late EllipticCurveFacade _facade;
  late ECPoint intermediatePoint;


  ECDHActor([EllipticCurve? ec]) {
    ec ??= getSecp256k1() as EllipticCurve;
    _facade = EllipticCurveFacade(ec);
    generateSecret();
    intermediatePoint = ECPoint(ec.G.X, ec.G.Y);
  }

  ///Generate secret of the party
  void generateSecret() {
    int length = _facade.curve.n.bitLength >> 3;
    Random generator = Random.secure();
    _secret = BigInt.zero;
    for(int i = 0; i < length; i++) {
      _secret = (_secret << 8) + BigInt.from(generator.nextInt(256));
    }
  }

  ///Create secret-based elliptic curves point
  ECPoint yieldPoint([ECPoint? point]) {
    point ??= intermediatePoint;
    intermediatePoint = _facade.mulScalar(point, _secret);
    return _facade.mulScalar(point, _secret);
  }

  ///Returns yielded result
  BigInt getMutualSecret() {
    return intermediatePoint.x;
  }
}