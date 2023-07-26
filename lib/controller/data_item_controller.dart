//
// import 'dart:convert';
// import 'package:flutter/services.dart'; // Import the flutter/services.dart package
//
// import '../model/data_items.dart';
//
// class DataItemController{
//
//
//
//
//
//   List<DataItem> parseDataItems(String jsonData) {
//     final List<dynamic> parsedList = jsonDecode(jsonData);
//     return parsedList.map((item) => DataItem(
//       pron: List<String>.from(item['pron']),
//       bn: item['bn'],
//       en: item['en'],
//       bn_syns: List<String>.from(item['bn_syns']),
//       en_syns: List<String>.from(item['en_syns']),
//       sents: List<String>.from(item['sents']),
//     )).toList();
//   }
//
//
//
//   // Load JSON data from the asset
//   Future<String> loadAsset() async {
//     return await rootBundle.loadString('json_wordlist/BengaliDictionary.json');
//   }
// }