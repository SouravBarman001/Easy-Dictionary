

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:translator/translator.dart';

import '../screens/translation_screen.dart';
import '../screens/word_list.dart';

class BottomNavController extends ChangeNotifier{

  int selectedIndex = 0;

  void onItemTapped(int index) {
      selectedIndex = index;
      print("index : $selectedIndex");

      if(selectedIndex == 0){
        Get.to(()=>const TranslationScreen(),transition: Transition.downToUp,duration: const Duration(milliseconds: 500));
      }
      else if(selectedIndex == 1){
       // Get.to(()=>const TranslationScreen(),transition: Transition.downToUp,duration: const Duration(milliseconds: 500));
      }
      else if(selectedIndex == 2){
       // Get.to(()=>const TranslationScreen(),transition: Transition.downToUp,duration: const Duration(milliseconds: 500));
      }
      else if(selectedIndex == 3){
        Get.to(()=>const WordList(),transition: Transition.downToUp,duration: const Duration(milliseconds: 500));
      }

      notifyListeners();
  }



}