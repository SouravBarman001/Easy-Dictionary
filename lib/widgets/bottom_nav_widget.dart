import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/bottom_nav_controller.dart';
class BottomNavBarCommon extends StatelessWidget {
  const BottomNavBarCommon({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomNavController =  Provider.of<BottomNavController>(context);

    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.g_translate_rounded,color: Colors.blue,),
          label: 'Translate',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.camera_alt_rounded,color: Colors.blue,),
          label: 'Image To Text',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border_outlined,color: Colors.blue,),
          label: 'Favorite',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_book_rounded,color: Colors.blue,),
          label: 'Word List',
        ),
      ],
      currentIndex: bottomNavController.selectedIndex,
      selectedItemColor: Colors.black,

      onTap: bottomNavController.onItemTapped,
    );
  }
}
