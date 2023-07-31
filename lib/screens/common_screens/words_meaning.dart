import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../../controller/word_meaning_controller.dart';
import '../../hivedb/word.dart';
import '../../widgets/bottom_nav_widget.dart';

class WordMeaning extends StatefulWidget {
  const WordMeaning({super.key});

  @override
  State<WordMeaning> createState() => _WordMeaningState();
}

class _WordMeaningState extends State<WordMeaning>
    with TickerProviderStateMixin {

  final TextEditingController textEditingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    final wordMeaningProvider = Provider.of<WordMeaningController>(context);

    return GestureDetector(
      onTap: ()=>FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: const Color(0xffeeeeff),
        bottomNavigationBar: const BottomNavBarCommon(),
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
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                  ),
                ),
                width: double.infinity,
                height: Get.height * .23,
                    child: Container(
                      padding: EdgeInsets.zero,
                       margin: const EdgeInsets.only(top: 30),
                    child: Column(
                    children: [
                      Row(
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
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 28),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextField(
                          controller: textEditingController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                             borderRadius: BorderRadius.circular(20)
                            ),
                            disabledBorder: InputBorder.none,
                            fillColor: Colors.white,
                            hintText: 'Search',
                            prefixIcon: InkWell(
                                onTap: () {
                                  wordMeaningProvider.searchDataFromHive(textEditingController);
                                },
                                child: const Icon(Icons.search)),
                            border: const OutlineInputBorder(),
                          ),

                        ),
                      )
                    ],
                  ),
                ),
              ),
                   SizedBox(
                height: Get.height * .018,
              ),
                  wordMeaningProvider.searchResults.isEmpty ? Container(
                    width: double.infinity,
                    height: Get.height * .56,
                    color: const Color(0xffeeeeff),
                  ) : Visibility(
                    visible: wordMeaningProvider.visibilityCheck,
                    child: Container(
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
                  height: Get.height * .56,
                     child: Padding(
                    padding: const EdgeInsets.only(top: 25, left: 35),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.defaultDialog(
                                    titlePadding: const EdgeInsets.all(14),
                                    title: 'Sorry...',
                                    middleText:
                                        'Speech feature will be included in a later version.',
                                  );
                                },
                                child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: const Color(0xff3f13ce),
                                        borderRadius: BorderRadius.circular(100)),
                                    child: const Icon(
                                      Icons.keyboard_voice_outlined,
                                      color: Colors.white,
                                      size: 30,
                                    )),
                              ),
                              const SizedBox(
                                width: 18,
                              ),
                              Container(
                                //color: Colors.blue,
                                //alignment: Alignment.center,
                                padding: const EdgeInsets.only(top:18),
                                height: 100,
                                width: 200,
                                child: ListView.builder(
                                    itemCount: 1,
                                    itemBuilder: (context, index) {
                                      final getWord = wordMeaningProvider.searchResults[0];

                                      return Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            getWord.en,
                                            style: const TextStyle(fontSize: 30),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            getWord.bn.toString(),
                                            style: const TextStyle(fontSize: 20),
                                          ),
                                        ],
                                      );

                                    },),
                              ),
                            ],
                          ),
                          const Divider(
                            height: 15,
                            thickness: 0.7,
                            indent: 1,
                            endIndent: 20,
                            color: Colors.black,
                          ),
                          Container(
                            height: 340,
                            width: double.infinity,
                            child: ListView.builder(
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                final word = wordMeaningProvider.searchResults[index];
                                final bnSynonymsDisplay = word.bnSyns.join(', ');
                                final enSynonymsDisplay = word.enSyns.join(', ');
                                final sentsDisplay = word.sents.join('</br></br>');

                                return ListTile(
                                  title: Text(
                                    word.en.toString(),
                                    style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ), // Display English word
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Bengali: ${word.bn}',
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ), // Display Bengali word
                                      Text(
                                        'Bengali Synonyms: $bnSynonymsDisplay',
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black87),
                                      ), // Display Bengali synonyms
                                      Text(
                                        'English Synonyms: $enSynonymsDisplay',
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black87),
                                      ), // Display English synonyms
                                      Html(
                                        data: sentsDisplay.toString(),
                                      )
                                    ],
                                  ),
                                  trailing: IconButton(
                                    icon: const Icon(
                                      Icons.favorite_outline_sharp,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      // Handle button click to show word details
                                      // _showWordDetails(word);
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
                    SizedBox(
                height: wordMeaningProvider.visibilityCheck == false || wordMeaningProvider.searchResults.isEmpty  ? Get.height * .064 : Get.height * .064,
              ),

            ],
          ),
        )),
      ),
    );
  }
}
