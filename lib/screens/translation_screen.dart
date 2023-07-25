import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translator/translator.dart';

class TranslationScreen extends StatefulWidget {
  const TranslationScreen({super.key});

  @override
  State<TranslationScreen> createState() => _TranslationScreenState();
}

class _TranslationScreenState extends State<TranslationScreen> {
  List<String> languages = [
    'English',
    'Hindi',
    'Bengali',
    'Arabic	',
    'German',
    'Russian',
    'Spanish',
    'Urdu',
    'Japanese	',
    'Italian',

  ];
  List<String> languagescode = [
    'en',
    'hi',
    'bn',
    'ar',
    'de',
    'ru',
    'es',
    'ur',
    'ja',
    'it',

  ];
  final translator = GoogleTranslator();
  String from = 'en';
  String to = 'bn';
  String data = 'আপনি কেমন আছেন?';
  String selectedvalue = 'English';
  String selectedvalue2 = 'Bengali';
  TextEditingController controller =
  TextEditingController(text: 'How are you?');
  final formkey = GlobalKey<FormState>();
  bool isloading = false;
  translate() async {
    try {
      if (formkey.currentState!.validate()) {
        await translator
            .translate(controller.text, from: from, to: to)
            .then((value) {
          data = value.text;
          isloading = false;
          setState(() {});
          // print(value);
        });
      }
    } on SocketException catch (_) {
      isloading = true;
      SnackBar mysnackbar = const SnackBar(
        content: Text('Internet not Connected'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 5),
      );
      ScaffoldMessenger.of(context).showSnackBar(mysnackbar);
      setState(() {});
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
  // @override
  // void initState() {
  //   super.initState();
  //   translate();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: Colors.indigo,
            )),
        title: const Text(
          "Let's translate",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 28),
        ),
      ),
      backgroundColor: const Color(0xffeeeeff),
      body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               SizedBox(
                height: Get.height * .1,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text('From',style: TextStyle(
                      fontSize: 16,
                    ),),
                    const Icon(Icons.arrow_right_alt),
                    // const SizedBox(
                    //   width: 100,
                    // ),
                    DropdownButton(
                      value: selectedvalue,
                      focusColor: Colors.transparent,
                      items: languages.map((lang) {
                        return DropdownMenuItem(
                          value: lang,
                          child: Text(lang),
                          onTap: () {
                            if (lang == languages[0]) {
                              from = languagescode[0];
                            } else if (lang == languages[1]) {
                              from = languagescode[1];
                            } else if (lang == languages[2]) {
                              from = languagescode[2];
                            } else if (lang == languages[3]) {
                              from = languagescode[3];
                            } else if (lang == languages[4]) {
                              from = languagescode[4];
                            } else if (lang == languages[5]) {
                              from = languagescode[5];
                            } else if (lang == languages[6]) {
                              from = languagescode[6];
                            } else if (lang == languages[7]) {
                              from = languagescode[7];
                            } else if (lang == languages[8]) {
                              from = languagescode[8];
                            }
                            setState(() {
                              // print(lang);
                              // print(from);
                            });
                          },
                        );
                      }).toList(),
                      onChanged: (value) {
                        selectedvalue = value!;
                      },
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(top: 20,left: 40,right: 40,bottom: 20),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black45)),
                child: Form(
                  key: formkey,
                  child: TextFormField(
                    controller: controller,
                    maxLines: null,
                    minLines: null,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                        errorBorder: InputBorder.none,
                        errorStyle: TextStyle(color: Colors.black),
                        ),
                        style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  ),
                ),
              ),
              Container(

                margin: const EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text('From',style: TextStyle(
                      fontSize: 16,
                    ),),
                    const Icon(Icons.arrow_right_alt),
                    DropdownButton(
                      value: selectedvalue2,
                      focusColor: Colors.transparent,
                      items: languages.map((lang) {
                        return DropdownMenuItem(
                          value: lang,
                          child: Text(lang),
                          onTap: () {
                            if (lang == languages[0]) {
                              to = languagescode[0];
                            } else if (lang == languages[1]) {
                              to = languagescode[1];
                            } else if (lang == languages[2]) {
                              to = languagescode[2];
                            } else if (lang == languages[3]) {
                              to = languagescode[3];
                            } else if (lang == languages[4]) {
                              to = languagescode[4];
                            } else if (lang == languages[5]) {
                              to = languagescode[5];
                            } else if (lang == languages[6]) {
                              to = languagescode[6];
                            } else if (lang == languages[7]) {
                              to = languagescode[7];
                            } else if (lang == languages[8]) {
                              to = languagescode[8];
                            }
                            setState(() {
                              print(lang);
                              print(from);
                            });
                          },
                        );
                      }).toList(),
                      onChanged: (value) {
                        selectedvalue2 = value!;
                      },
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20,left: 40,right: 40,bottom: 20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black54)),
                child: Center(
                  child: SelectableText(
                    data,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: translate,
                  style: const ButtonStyle(
                      backgroundColor:
                      MaterialStatePropertyAll(Colors.blueAccent),
                      fixedSize: MaterialStatePropertyAll(Size(330, 45))),
                  child:isloading?const SizedBox.square(
                    dimension: 20,
                    child: CircularProgressIndicator(color: Colors.white,),
                  ): const Text('Translate',style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),)),
              const SizedBox(
                height: 30,
              )
            ],
          )),
    );
  }
}