import 'dart:core';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../hivedb/word.dart';

class WordListController extends ChangeNotifier {
  static List<dynamic> allWords = [];

Future<List<dynamic>> getWordListTwo() async {
     print('from getWordListTwo');
    // Perform search operation based on the "en" field
    final box = Hive.box<Word>('dataBox');
    allWords = box.values.toList();
    return allWords;
}



}
