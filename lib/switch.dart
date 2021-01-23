import 'package:flutter/cupertino.dart';

class Switch1 with ChangeNotifier {
  bool redo = false;

  void SwitchOnChange() {
    if (redo == false) {
      redo = true;
    } else {
      redo = false;
    }
    notifyListeners();
  }
}
