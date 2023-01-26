import 'dart:async';

class Bloc {
  Bloc._internal();

  static Bloc bloc = Bloc._internal();

  factory Bloc() {
    return bloc;
  }

  StreamController<bool> blocStream = StreamController.broadcast();
}