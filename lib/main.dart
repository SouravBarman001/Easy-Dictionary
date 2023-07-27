import 'package:dictionary_app/screens/common_screens/words_meaning.dart';
import 'package:dictionary_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import 'controller/data_item_controller.dart';
import 'controller/home_screen_controller.dart';
import 'dummy/dictionary_app.dart';
import 'dummy/get_data_from_json_and_show.dart';
import 'hivedb/word.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  // Register Hive adapters
  Hive.registerAdapter(WordAdapter());
  // Open the box
  await Hive.openBox<Word>('dataBox');
  DataItemController dataItemController = DataItemController();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>HomeScreenController()),
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
       home: DictionaryApp(),
    );
  }
}
