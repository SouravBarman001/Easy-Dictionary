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
  final List<String> sents = [
    "Now, large supermarkets <b>carry</b> as many as 20,000 different food items on their shelves.",
    "A few newspapers did <b>carry</b> the story but wildly distorted the facts, greatly upsetting the brothers."
  ];

  // ignore: non_constant_identifier_names
  // final List<String> en_syns = [
  //   "convey",
  //   "transfer",
  //   "move",
  //   "take",
  //   "bring",
  //   "bear",
  //   "lug",
  //   "tote",
  //   "fetch",
  //   "cart"
  // ];

  // ignore: non_constant_identifier_names
  // final List<String> bn_syns = [
  //   "বয়ে নিয়ে যাওয়া",
  //   "বহন করা",
  //   "টানা",
  //   "বহিয়া লইয়া যাত্তয়া",
  //   "সংবাহন করা",
  //   "ধারণ করা",
  //   "ভারবহন করা",
  //   "ঘটান",
  //   "নেত্তয়া",
  //   "লত্তয়া",
  //   "বলপূর্বক অধিকার করা",
  //   "জের টানা",
  //   "আচরণ করা",
  //   "দেহভঙ্গি করা",
  //   "গর্ভবতী হত্তয়া",
  //   "পৌঁছাইয়া দেত্তয়া",
  //   "পৌঁছান",
  //   "লাভ করা",
  //   "প্রকাশ করা",
  //   "প্রসারিত হত্তয়া",
  //   "বহা",
  //   "ব্যাপ্ত হত্তয়া",
  //   "বহন"
  // ];

  List<dynamic> searchResults = [];
  final TextEditingController textEditingController = TextEditingController();
  // ignore: prefer_typing_uninitialized_variables
  var words;
  var visibilityCheck = false;

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    final wordMeaningProvider = Provider.of<WordMeaningController>(context);

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
                          disabledBorder: InputBorder.none,
                          fillColor: Colors.white,
                          hintText: 'Search',
                          prefixIcon: InkWell(
                              onTap: () {
                                  //  final box = Hive.box<Word>('dataBox');
                                  // var wordResults = box.values.where((word) => word.en.toLowerCase().contains(query.toLowerCase())).toList();
                                  // print("value : $wordResults");
                                  setState(() {
                                    words =
                                        textEditingController.text.toString();
                                    print('Search word $words');
                                    // Perform search operation based on the "en" field
                                    final box = Hive.box<Word>('dataBox');
                                    searchResults = box.values
                                        .where((word) => word.en.toLowerCase() == words) // Compare exact matches only
                                        .toList();

                                    print(searchResults);
                                    if(searchResults.isEmpty){
                                      Get.snackbar(
                                         "$words",
                                         "Does not found!!",
                                        icon: const Icon(Icons.not_listed_location_rounded, color: Colors.white),
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor: Colors.green,
                                        borderRadius: 20,
                                        margin: const EdgeInsets.all(15),
                                        colorText: Colors.white,
                                        duration: const Duration(seconds: 4),
                                        isDismissible: true,
                                        forwardAnimationCurve: Curves.easeOutBack,
                                      );
                                    }
                                    visibilityCheck = true;
                                  });

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
                searchResults.isEmpty ? Container(
                  width: double.infinity,
                  height: Get.height * .56,
                  color: const Color(0xffeeeeff),
                ) : Visibility(
                  visible: visibilityCheck,
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
                                    final getWord = searchResults[0];

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
                              final word = searchResults[index];
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
                                    Icons.info,
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
              height: visibilityCheck == false || searchResults.isEmpty  ? Get.height * .064 : Get.height * .064,
            ),
               const BottomNavWidget(),
          ],
        ),
      )),
    );
  }
}
