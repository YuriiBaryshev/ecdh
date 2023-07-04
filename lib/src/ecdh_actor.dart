import 'dart:math';

///Represent actor/party of ECDH protocol
class ECDHActor {
  late BigInt _secret;

  ///Generate secret of the party
  void generateSecret(BigInt maxValue) {
    int length = maxValue.bitLength >> 3;
    Random generator = Random.secure();
    _secret = BigInt.zero;
    for(int i = 0; i < length; i++) {
      _secret = (_secret << 8) + BigInt.from(generator.nextInt(256));
    }
  }


}