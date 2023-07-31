import 'package:dictionary_app/controller/home_screen_controller.dart';
import 'package:dictionary_app/controller/word_list_controller.dart';
import 'package:dictionary_app/widgets/show_alert_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../controller/bottom_nav_controller.dart';
import '../controller/data_item_controller.dart';
import '../widgets/bottom_nav_widget.dart';
import 'common_screens/words_meaning.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final TextEditingController _textEditingController = TextEditingController();
  HomeScreenController homeScreenController = HomeScreenController();


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
                          Container(
                            margin: const EdgeInsets.only(top: 25,right: 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                 IconButton(onPressed: () {
                                   ShowAlertDialog.showDevInfo(context);
                                 }, icon: const Icon(CupertinoIcons.info,color: Colors.white,size: 25, ),),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: Get.height * .10,
                          ),
                          DefaultTextStyle(
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.w600,
                            ),
                            child: AnimatedTextKit(
                              animatedTexts: [
                                TypewriterAnimatedText('Welcome',speed: const Duration(milliseconds: 500)),
                              ],
                              pause: const Duration(seconds: 2),
                              repeatForever: true,
                            ),
                          ),

                          const SizedBox(height: 3,),
                          const Text(
                            'English - Bangla',
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
                            height: Get.height * .08,
                          ),
                          InkWell(
                            onTap: (){
                              Get.to(()=> const WordMeaning(),transition: Transition.downToUp,duration: const Duration(milliseconds: 500));
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              alignment: Alignment.center,
                              margin: const EdgeInsets.symmetric(horizontal: 50),
                              width: Get.width * .8,
                              decoration: BoxDecoration(
                                color: Colors.lightBlue.shade600,
                                borderRadius: BorderRadius.circular(50),
                              ),
                                child: const Text('Search Words',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600
                                ),),

                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * .156,
              ),
            //  const BottomNavWidget(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBarCommon(),
    );
  }


}
