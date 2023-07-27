
import 'package:flutter/cupertino.dart';

import 'data_item_controller.dart';

class HomeScreenController extends ChangeNotifier {
  String searchWord = '';
  int wordIndex = -1; // Initialize to -1 to indicate that the word is not found
  DataItemController dataItemController = DataItemController();

  void getWord(String word) {
    searchWord = word;
    print("Word from Text field: $searchWord");

    searchWordInList(word);
    notifyListeners();
  }

  Future<void> searchWordInList(String word) async {
    for (var listData in DataItemController.dictionaryList) {
      if (listData.engWord.contains(word)) {
        print('Word Contains in the list');

        print(listData.banWord);
        wordIndex = listData.engWord.indexOf(searchWord);
        print("Word index $wordIndex");
        print(listData.engSyn.length);
        break; // Exit the loop once a match is found
      }

    }

    // If the word is not found, the wordIndex will still be -1
    if (wordIndex != -1) {
      print(DataItemController.dictionaryList[wordIndex].banWord.toString());
    } else {
      print("Word not found in the list.");
    }
  }
}