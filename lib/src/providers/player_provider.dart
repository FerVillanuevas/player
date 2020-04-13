import 'package:flutter/material.dart';

class PlayerProvider with ChangeNotifier{

  bool _playing = false;
  Duration _duration = new Duration(milliseconds: 0);
  Duration _current = new Duration( milliseconds: 0);

  double get percent => (this._duration.inSeconds > 0)
                        ? this._current.inSeconds / this._duration.inSeconds : 0;

  bool get playing => this._playing;
  set playing(bool valor) {
    this._playing = valor;
    notifyListeners();
  }

  Duration get duration => this._duration;
  set duration(Duration valor ) {
     this._duration = valor;
     notifyListeners();
  }

  Duration get current => this._current;
  set current(Duration valor ) {
    this._current = valor;
    notifyListeners();
  }

}