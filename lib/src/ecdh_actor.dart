import 'dart:math';

///Represent actor/party of ECDH protocol
class ECDHActor {
  late BigInt _secret;

  ///Generate secret of the party
  void _generateSecret({int bitLength = 256}) {
    if(bitLength & 7 != 0) {
      throw ArgumentError("Secret value's length should multiple 8");
    }
    Random generator = Random.secure();
    _secret = BigInt.zero;
    for(int i = 0; i < (bitLength >> 3); i++) {
      _secret = (_secret << 8) + BigInt.from(generator.nextInt(256));
    }
  }
}