
import 'package:flutter/cupertino.dart';

class SplashScreenController extends ChangeNotifier{

  bool splashOff = false;

  void splashScreenPassed(bool off){
    splashOff = off;
    print("Splash off : $splashOff");
    notifyListeners();
  }


}