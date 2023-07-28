


import 'dart:convert';

import 'package:dictionary_app/model/dictionary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

import '../hivedb/word.dart';
import '../model/data_items.dart';
// BengaliDictionary.json
// dictionary_test.json


class DataItemController extends ChangeNotifier{

 // List<DataItem> dataItemList=[];

  static List<Dictionary> dictionaryList = [];



  Future<String> loadDataItemsFromAssets()async{
    return await rootBundle.loadString('json_wordlist/BengaliDictionary.json');
  }

  // Future<List<Dictionary>> loadData() async {
  //   String jsonString = await loadDataItemsFromAssets();
  //   final jsonResponse = json.decode(jsonString).cast<Map<String,dynamic>>();
  //   // final data = jsonResponse.map<DataItem>((json) => DataItem.fromJson(json)).toList();
  //   // dataItemList.add(data);
  //   //DataItem dataItem ;
  //
  //   Dictionary dictionary;
  //   dictionaryList.clear();
  //   for(var data in jsonResponse){
  //     dictionary = Dictionary.fromJson(data);
  //     print('Data loaded to the model');
  //     dictionaryList.add(dictionary);
  //   }
  //   print('Data loaded to the model');
  //   // print("Name : ${dataItem.name}");
  //   // print("Places : ${dataItem.places}");
  //   // print("Image : ${dataItem.images}");
  //   // //
  //   print("Dictionary length of dataItems : ${dictionaryList.length}");
  //  return dictionaryList;
  // }

  Future<void> storeData() async {
    try {
      // Load the JSON data from your file or API (you can replace this part with your actual data loading)
      String jsonString = await loadDataItemsFromAssets();
      print('data get form json');
      final jsonData = json.decode(jsonString);

      // Open the box
      var box = Hive.box<Word>('dataBox');

      // Clear the box before adding new data
      //box.clear();
       if(box.isEmpty){
         // Iterate through the JSON data and store each entry in the box
         for (var wordData in jsonData) {
           final key = wordData['en']; // Use the English word as the key

// Handle potential null values for pron, bn_syns, and en_syns
           // Handle potential null values for pron, bn_syns, and en_syns
           final pron = (wordData['pron'] as List<dynamic>?)
               ?.whereType<String>() // Remove null values from the list
               ?.toList() ?? []; // If the pron is null, convert it to an empty list

           final bnSyns = (wordData['bn_syns'] as List<dynamic>?)?.cast<String>() ?? [];
           final enSyns = (wordData['en_syns'] as List<dynamic>?)?.cast<String>() ?? [];

           final word = Word(
             pron: pron,
             bn: wordData['bn'],
             en: wordData['en'],
             bnSyns: bnSyns,
             enSyns: enSyns,
             sents: List<String>.from(wordData['sents']),
           );
           print("$key added to the box");

           box.put(key, word);
         }

         print('Data stored successfully.');

       }else{
         print('box is not empty');

       }

    } catch (e) {
      // Handle any potential errors here
      print('Error storing data: $e');
    }
  }



}


