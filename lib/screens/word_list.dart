import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

import '../../widgets/bottom_nav_widget.dart';
import '../controller/word_list_controller.dart';
import '../hivedb/word.dart';
import '../widgets/show_alert_dialog.dart';

class WordList extends StatefulWidget {
  const WordList({super.key});

  @override
  State<WordList> createState() => _WordListState();
}

class _WordListState extends State<WordList> with TickerProviderStateMixin{
  WordListController wordListController = WordListController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    wordListController.getWordListTwo();
  }

  @override
  Widget build(BuildContext context) {
   // final englishWordsCount = Provider.of<WordListController>(context);

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
                  height: Get.height * .67,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25,left: 35),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [

                             // const SizedBox(width: 18,),
                              const Text('Word List',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),),
                            //  const SizedBox(width: 18,),
                              Text("${WordListController.allWords.length} words")

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
                            height: Get.height * .53,
                            // color: Colors.lightBlue,
                            child:  Align(
                              // alignment: Alignment.topCenter,
                              child:FutureBuilder<List<dynamic>>(
                                future: Provider.of<WordListController>(context).getWordListTwo(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState == ConnectionState.waiting) {
                                    // Future is still loading
                                    return const Center(child: CircularProgressIndicator());
                                  } else if (snapshot.hasError) {
                                    // Future loading failed
                                    return const Center(child: Text('Error loading data'));
                                  } else {
                                    // Future loading completed, display the data
                                    List<dynamic> englishWords = snapshot.data ?? [];
                                    return ListView.builder(
                                      itemCount: englishWords.length,
                                      itemBuilder: (BuildContext context, int index) {
                                        final word = englishWords[index];

                                        var serialIndex = index+1;
                                        return Card(
                                          elevation: 2,
                                          child: ListTile(
                                            leading: Text(serialIndex.toString()),
                                            title: Text(
                                              englishWords[index].en.toString().toString(),
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                                            ),
                                            trailing: IconButton(
                                                onPressed: () {
                                                 // Handle button click to show word details
                                                  ShowAlertDialog.showWordDetails(context,word);
                                                },
                                                icon: const Icon(Icons.info_outline)),
                                          ),
                                        );
                                      },
                                    );
                                  }
                                },
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * .0450,
                ),

              ],
            ),
          )),
    );
  }

}
