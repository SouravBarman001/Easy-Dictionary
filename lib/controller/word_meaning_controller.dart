

import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

import '../hivedb/word.dart';

class WordMeaningController extends ChangeNotifier{

  List<dynamic> searchResults = [];

  void searchDataFromHive(String words){
     print('searchDataFromHive: $words');
    final box = Hive.box<Word>('dataBox');
    searchResults = box.values.where((word) => word.en.toLowerCase().contains(words.toLowerCase())).toList();
    notifyListeners();
  }
}