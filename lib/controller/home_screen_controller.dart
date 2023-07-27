
import 'package:dictionary_app/controller/word_meaning_controller.dart';
import 'package:flutter/cupertino.dart';

import '../screens/common_screens/words_meaning.dart';
import 'data_item_controller.dart';

class HomeScreenController extends ChangeNotifier {

  // ignore: prefer_typing_uninitialized_variables
  var userWord;

  void getUserWord(userWordFrom){
    userWord = userWordFrom;
    print("user word $userWord");
    WordMeaningController wordMeaningController = WordMeaningController();
    wordMeaningController.searchDataFromHive(userWord);
    notifyListeners();
  }

}