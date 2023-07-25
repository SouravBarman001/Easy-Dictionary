import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/bottom_nav_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeeeeff),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            //  mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: Get.height * .13,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff28185c),
                      borderRadius: BorderRadius.circular(58),
                    ),
                    height: Get.height * .57,
                    width: Get.width * .89,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: Get.height * .12,
                          ),
                          const Text(
                            'Welcome',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Text(
                            'English - Bangle',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: Get.height * .06,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.5, vertical: 8.0),
                                decoration: BoxDecoration(
                                  color: const Color(0xff1d0f4b),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'images/flags/united-states-of-america.png',
                                      width:
                                          20, // Set the desired width of the image
                                      height:
                                          20, // Set the desired height of the image
                                    ),
                                    const SizedBox(
                                      width: 7,
                                    ),
                                    const Text(
                                      'English',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child:
                                    const Icon(Icons.arrow_right_alt_outlined),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.5, vertical: 8.0),
                                decoration: BoxDecoration(
                                  color: const Color(0xff1d0f4b),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'images/flags/bangladesh.png',
                                      width:
                                          20, // Set the desired width of the image
                                      height:
                                          20, // Set the desired height of the image
                                    ),
                                    const SizedBox(
                                      width: 7,
                                    ),
                                    const Text(
                                      'বাংলা',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Get.height * .06,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            width: Get.width * .8,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const TextField(
                              decoration: InputDecoration(
                                hintText:
                                    'Enter Word Here', // Optional: Placeholder text
                                border: InputBorder.none,
                                //   contentPadding: EdgeInsets.symmetric(horizontal: 20),
                                icon: Icon(Icons.search_rounded),
                                fillColor: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * .16,
              ),
              const BottomNavWidget(),
            ],
          ),
        ),
      ),
    );
  }
}


