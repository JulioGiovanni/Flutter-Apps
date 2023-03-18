import 'package:flutter/material.dart';

class TipProvider with ChangeNotifier {
  final TextEditingController _totalController = TextEditingController();
  int _tipSelected = 0;
  double _tipPercentage = 0.05;
  bool _roundTip = false;
  double _total = 0.0;

  TextEditingController get service => _totalController;
  double get total => _total;
  double get tipPercentage => _tipPercentage;
  bool get roundTip => _roundTip;
  int get tipSelected => _tipSelected;

  void roundTipSwitch(bool value) {
    _roundTip = value;
    notifyListeners();
  }

  void setTipPercentage(double value) {
    _tipPercentage = value;
    notifyListeners();
  }

  void setTipSelected(int value) {
    _tipSelected = value;
    notifyListeners();
  }

  void calculateTotalTip() {
    if (_roundTip) {
      _total = double.parse(_totalController.text) + _roundTipAmount();
      notifyListeners();
      return;
    } else {
      _total = double.parse(_totalController.text) + _roundTipAmount();
      notifyListeners();
      return;
    }
  }

  double _roundTipAmount() {
    final double tip = double.parse(_totalController.text) * _tipPercentage;
    final double tipRounded = tip.ceilToDouble();
    final double tipDifference = tipRounded - tip;

    if (tipDifference <= 0.5) {
      return tipRounded;
    } else {
      return tipRounded - 1;
    }
  }
}
