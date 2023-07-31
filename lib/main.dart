import 'package:dictionary_app/screens/home_screen.dart';
import 'package:dictionary_app/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import 'controller/bottom_nav_controller.dart';
import 'controller/data_item_controller.dart';
import 'controller/home_screen_controller.dart';
import 'controller/splash_screen_controller.dart';
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
        ChangeNotifierProvider(create: (_)=> SplashScreenController()),

      ],
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {

    final splashOff = Provider.of<SplashScreenController>(context);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
       home: splashOff.splashOff == true ? const HomeScreen() : const SplashScreen(),
       getPages: [
        GetPage(name: '/home', page: () => const HomeScreen(),transition: Transition.rightToLeft,transitionDuration:const Duration(seconds: 3)),
      ],
    );
  }
}
