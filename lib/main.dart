import 'package:dictionary_app/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import 'controller/bottom_nav_controller.dart';
import 'controller/data_item_controller.dart';
import 'controller/home_screen_controller.dart';
import 'controller/word_list_controller.dart';
import 'controller/word_meaning_controller.dart';

import 'hivedb/word.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  // Register Hive adapters
  Hive.registerAdapter(WordAdapter());
  Hive.registerAdapter(FavouriteWordAdapter());
  // Open the box
  await Hive.openBox<Word>('dataBox');
  await Hive.openBox<Word>('favouriteData');
  DataItemController dataItemController = DataItemController();
  dataItemController.storeData();

  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>HomeScreenController()),
        ChangeNotifierProvider(create: (_)=> WordMeaningController()),
        ChangeNotifierProvider(create: (_)=> WordListController()),
        ChangeNotifierProvider(create: (_)=> BottomNavController()),

      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
       home: HomeScreen(),
    );
  }
}
