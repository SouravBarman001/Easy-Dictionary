// import 'package:dictionary_app/model/dictionary.dart';
// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:async/async.dart';
// import 'package:flutter/services.dart';
// import 'package:dictionary_app/model/data_items.dart';
//
// import '../controller/data_item_controller.dart';
//
// class GetDataFromJson extends StatefulWidget {
//   const GetDataFromJson({super.key});
//
//   @override
//   State<GetDataFromJson> createState() => _GetDataFromJsonState();
// }
//
// class _GetDataFromJsonState extends State<GetDataFromJson> {
//
//
//   late DataItemController dataItemController = DataItemController();
//
//   int itemCount = 0;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//    // dataItemController.loadData();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: FutureBuilder<List<Dictionary>>(
//             future: dataItemController.loadData(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               } else if (snapshot.hasError) {
//                 return const Center(
//                   child: Text('Error loading data'),
//                 );
//               } else {
//                 List<Dictionary> dictionaryList = snapshot.data ?? [];
//                 return ListView.builder(
//                   itemCount: dictionaryList.length,
//                   itemBuilder: (context, index) {
//                     // Replace the following with the actual widgets you want to display for each dictionary item
//                    if( dictionaryList[index].engWord.contains('carry')){
//                      print('Contains');
//                      print("index of carry : ${dictionaryList[index].engWord.indexOf('carry')}");
//                    }
//                     return ListTile(
//                       title: Text(dictionaryList[0].engSyn.toString()),
//                       // Add more widgets to display other data from the Dictionary object
//                     );
//                   },
//                 );
//               }
//             },
//           ),
//       ),
//     );
//   }
// }
