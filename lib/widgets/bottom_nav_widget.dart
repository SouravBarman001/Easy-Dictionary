import 'package:flutter/material.dart';
class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: 80,
      color: const Color(0xffffffff),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xffe9eaff),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.g_translate_rounded,
                    color: Colors.blue,
                  )),
              const Text('Translate'),
            ],
          ),
          Column(
            children: [
              Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xffe9eaff),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.camera_alt_rounded,
                    color: Colors.blue,
                  )),
              const Text('Image Search'),
            ],
          ),
          Column(
            children: [
              Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xffe9eaff),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.blue,
                  )),
              const Text('Favorite'),
            ],
          ),
          InkWell(
            onTap: (){},
            child: Column(
              children: [
                Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xffe9eaff),  // normal --> 0xffe9eaff
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.menu_book_rounded,
                      color: Colors.blue,
                    )),
                const Text('Word List'),
              ],
            ),
          )
        ],
      ),
    );
  }
}