

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:hive/hive.dart';

import '../hivedb/word.dart';
import 'package:flutter/material.dart';

class WordMeaningController extends ChangeNotifier{

  List<dynamic> searchResults = [];
 // final TextEditingController textEditingController = TextEditingController();
  // ignore: prefer_typing_uninitialized_variables
  var words;
  var visibilityCheck = false;



  void searchDataFromHive(TextEditingController textEditingController){
    words = textEditingController.text.toString();
    print('Search word $words');
    // Perform search operation based on the "en" field
    final box = Hive.box<Word>('dataBox');
    searchResults = box.values
        .where((word) => word.en.toLowerCase() == words) // Compare exact matches only
        .toList();

    print(searchResults);
    if(searchResults.isEmpty){
      Get.snackbar(
        "$words",
        "This Word was not found.!!",
        icon: const Icon(Icons.not_listed_location_rounded, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        borderRadius: 20,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 4),
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,
      );
    }
    visibilityCheck = true;

    notifyListeners();
  }
}