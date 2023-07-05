Implementation of ECDH using Dart

## Features

1. Implements models of ECDH actors/parties, which allows to implement any number of parties ECDH [see example for 3 parties ECDH instance](./example/ecdh_example.dart).
2. Implements facade for 2 parties ECDH, where one can call as integrated method `execute` as well as each step separately.

## Getting started

1. Install Dart SDK and Flutter framework.
2. Install IDE (this was developed using Android studio, but any Dart-supporting will do).
3. Run command flutter test in project's folder in order to see that every thing is alright (all tests passed).

## Usage

Default secp256k1 curve usage
```dart
  ECDH ecdh = ECDH(); 
  ecdh.executeDH();//calling integration method
  print(ecdh.alice.getMutualSecret() == ecdh.bob.getMutualSecret()); //true
```

or alternatively p256 curve usage

```dart
EllipticCurve ec = getP256();
ECDH ecdh = ECDH(ec);
ecdh.generateSecrets();
ECPoint fromAlice = ecdh.aliceCreatesPointForExchange();
ECPoint fromBob = ecdh.bobCreatesPointForExchange();
ecdh.aliceComputesMutualSecret(fromBob);
ecdh.bobComputesMutualSecret(fromAlice);
print(ecdh.alice.getMutualSecret() == ecdh.bob.getMutualSecret()); //true
```

For more examples one may refer to `/example` folder.
