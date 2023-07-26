import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:async/async.dart';
import 'package:flutter/services.dart';
import 'package:dictionary_app/model/data_items.dart';

class GetDataFromJson extends StatefulWidget {
  const GetDataFromJson({super.key});

  @override
  State<GetDataFromJson> createState() => _GetDataFromJsonState();
}

class _GetDataFromJsonState extends State<GetDataFromJson> {

  Future<String> loadDataItemsFromAssets()async{
    return await rootBundle.loadString('json_wordlist/practice.json');
  }

  Future loadData() async {
    String jsonString = await loadDataItemsFromAssets();
    final jsonResponse = json.decode(jsonString);

    DataItem dataItem = DataItem.fromJson(jsonResponse);
    print("Name : ${dataItem.name}");
    print("Places : ${dataItem.places}");

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Text('data load from json file'),
      ),
    );
  }
}
