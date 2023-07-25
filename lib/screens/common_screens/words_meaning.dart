import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

import '../../widgets/bottom_nav_widget.dart';

class WordMeaning extends StatefulWidget {
  const WordMeaning({super.key});

  @override
  State<WordMeaning> createState() => _WordMeaningState();
}

class _WordMeaningState extends State<WordMeaning> with TickerProviderStateMixin{

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
                        onPressed: () {},
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
            height: Get.height * .5,
            child: Padding(
              padding: const EdgeInsets.only(top: 25,left: 35),
              child: Column(
                children: [
                   Row(
                     children: [
                       InkWell(
                         onTap: (){
                           Get.defaultDialog(
                               titlePadding: const EdgeInsets.all(14),
                               title: 'Sorry...',
                               middleText: 'Speech feature will be included in a later version.',
                           );
                         }
                         ,child: Container(
                             padding: const EdgeInsets.all(8)
                             ,decoration: BoxDecoration(
                             color: const Color(0xff3f13ce),
                             borderRadius: BorderRadius.circular(100)
                         )
                             ,child: const Icon(Icons.keyboard_voice_outlined,color: Colors.white,size: 30,)),
                       ),
                       const SizedBox(width: 18,),
                       const Column(
                         children: [
                           Text('carry',style: TextStyle(fontSize: 30),),
                           SizedBox(height: 5,),
                           Text('বহন',style: TextStyle(fontSize: 20),),

                         ],
                       ),

                     ],
                   ),
                  const Divider(
                    height: 30,
                    thickness: 0.7,
                    indent: 1,
                    endIndent: 20,
                    color: Colors.black,
                  ),
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                        labelPadding: const EdgeInsets.only(left: 20,right: 20),
                        labelColor: Colors.black,
                        indicatorColor: Colors.lightBlue,
                        unselectedLabelColor: Colors.teal,
                        controller: tabController,
                        tabs: const [
                          Tab(text: 'Sentence',),
                          Tab(text: 'EN_synonyms ',),
                          Tab(text: 'BN_synonyms ',)

                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding:  const EdgeInsets.all(5),
                    margin: const EdgeInsets.only(right: 15),
                    width: double.maxFinite,
                    height: 220,
                   // color: Colors.lightBlue,
                    child:  Align(
                     // alignment: Alignment.topCenter,
                      child: TabBarView(
                        controller: tabController,
                        children: [
                          ListView.builder(
                            itemCount: sents.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                margin: const EdgeInsets.only(top: 5),
                                child: Html(
                                  data: sents[index],
                                ),
                              );
                            },
                          ),
                          ListView.builder(
                            itemCount: en_syns.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                elevation: 0.3,
                                child: ListTile(
                                 // titleAlignment: ListTileTitleAlignment.center,
                                  title: Text(en_syns[index].toString(),textAlign: TextAlign.center,),
                                ),
                              );
                            },
                          ),
                          ListView.builder(
                            itemCount: bn_syns.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                elevation: 0.3,
                                child: ListTile(
                                  // titleAlignment: ListTileTitleAlignment.center,
                                  title: Text(bn_syns[index].toString(),textAlign: TextAlign.center,),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
          SizedBox(
            height: Get.height * .140,
          ),
          const BottomNavWidget(),
        ],
      )),
    );
  }
}
