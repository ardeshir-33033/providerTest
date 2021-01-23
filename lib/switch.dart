import 'package:flutter/cupertino.dart';

class Switch1 with ChangeNotifier {
  bool redo = false;

  void SwitchOnChange(bool val) {
    redo = val;
    notifyListeners();
  }
}

class Switch2 with ChangeNotifier {
  bool redo = false;

  void SwitchOnChange(bool val) {
    redo = val;
    notifyListeners();
  }
}

class RadioListProvider with ChangeNotifier{
  bool checkVal = false;

  void changeSwitch(bool val){
    checkVal = val;
    notifyListeners();
  }

}
