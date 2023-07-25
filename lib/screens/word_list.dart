import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

import '../../widgets/bottom_nav_widget.dart';

class WordList extends StatefulWidget {
  const WordList({super.key});

  @override
  State<WordList> createState() => _WordListState();
}

class _WordListState extends State<WordList> with TickerProviderStateMixin{

  final List<String> sents = [
    "Now, large supermarkets <b>carry</b> as many as 20,000 different food items on their shelves.",
    "A few newspapers did <b>carry</b> the story but wildly distorted the facts, greatly upsetting the brothers."
  ];

  // ignore: non_constant_identifier_names
  final List<String> en_syns = [
    "convey",
    "transfer",
    "move",
    "take",
    "bring",
    "bear",
    "lug",
    "tote",
    "fetch",
    "cart"
  ];

  // ignore: non_constant_identifier_names
  final List<String> bn_syns = [
    "বয়ে নিয়ে যাওয়া",
    "বহন করা",
    "টানা",
    "বহিয়া লইয়া যাত্তয়া",
    "সংবাহন করা",
    "ধারণ করা",
    "ভারবহন করা",
    "ঘটান",
    "নেত্তয়া",
    "লত্তয়া",
    "বলপূর্বক অধিকার করা",
    "জের টানা",
    "আচরণ করা",
    "দেহভঙ্গি করা",
    "গর্ভবতী হত্তয়া",
    "পৌঁছাইয়া দেত্তয়া",
    "পৌঁছান",
    "লাভ করা",
    "প্রকাশ করা",
    "প্রসারিত হত্তয়া",
    "বহা",
    "ব্যাপ্ত হত্তয়া",
    "বহন"
  ];




  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync:this);

    return Scaffold(
      backgroundColor: const Color(0xffeeeeff),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 3, right: 3),
                  decoration: const BoxDecoration(
                    color: Color(0xff28185c),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15),
                      bottomRight: Radius.circular(40),
                      bottomLeft: Radius.circular(40),
                    ),
                  ),
                  width: double.infinity,
                  height: Get.height * .151,
                  child: Container(
                    margin: const EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: Colors.white,
                                size: 30,
                              )),
                        ),
                        Container(
                            margin: const EdgeInsets.only(right: 20),
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.white,
                            ),
                            child: const Icon(
                              Icons.star_border_purple500_rounded,
                              color: Colors.blue,
                              size: 30,
                            )),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: Get.height * .06,),
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  decoration: const BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                    ),
                  ),
                  width: double.infinity,
                  height: Get.height * .6,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25,left: 35),
                    child: Column(
                      children: [
                        const Row(
                          children: [

                            SizedBox(width: 18,),
                            Text('Word List',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),),


                          ],
                        ),
                        const Divider(
                          height: 30,
                          thickness: 0.1,
                          indent: 8,
                          endIndent: 25,
                          color: Colors.grey,
                        ),

                        Container(
                         // color: Colors.lightBlue,
                          padding:  const EdgeInsets.all(5),
                          margin: const EdgeInsets.only(right: 15),
                          width: double.maxFinite,
                          height: Get.height * .45,
                          // color: Colors.lightBlue,
                          child:  Align(
                            // alignment: Alignment.topCenter,
                            child:ListView.builder(
                              itemCount: en_syns.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                  elevation: 2,
                                  child: ListTile(
                                    // titleAlignment: ListTileTitleAlignment.center,
                                    title: Text(en_syns[index].toString().capitalizeFirst!,textAlign: TextAlign.center,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * .0450,
                ),
                const BottomNavWidget(),
              ],
            ),
          )),
    );
  }
}
