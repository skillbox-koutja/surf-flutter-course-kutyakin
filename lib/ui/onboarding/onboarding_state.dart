import 'package:flutter/foundation.dart';

class OnboardingState extends ChangeNotifier {
  final int initFrame;
  int frame;

  OnboardingState(this.initFrame) : frame = initFrame;

  void changeFrame(int next) {
    frame = next;

    notifyListeners();
  }

  void reset() {
    frame = initFrame;

    notifyListeners();
  }
}