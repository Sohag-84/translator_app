// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:language_translator/constant/list.dart';
import 'package:translator/translator.dart';

class TranslatorPage extends StatefulWidget {
  const TranslatorPage({super.key});

  @override
  State<TranslatorPage> createState() => _TranslatorPageState();
}

class _TranslatorPageState extends State<TranslatorPage> {
  final translator = GoogleTranslator();
  bool isLoading = false;
  String from = 'en';
  String to = 'bn';
  String data = 'কেমন আছেন?';
  String selectedValue = 'English';
  String selectedValue2 = 'Bangla';
  TextEditingController controller =
      TextEditingController(text: 'How are you?');
  final formKey = GlobalKey<FormState>();

  translate() async {
    try {
      if (formKey.currentState!.validate()) {
        await translator
            .translate(controller.text, from: from, to: to)
            .then((value) {
          data = value.text;
          isLoading = false;
          setState(() {});
        });
      }
    } on SocketException catch (_) {
      isLoading = true;
      SnackBar mySnackBar = const SnackBar(
        content: Text('Internet not Connected'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 5),
      );
      ScaffoldMessenger.of(context).showSnackBar(mySnackBar);
      setState(() {});
    }
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 87, 104, 254),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 55, 66, 162),
        title: Text(
          "Translator",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                color: Colors.indigo.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("From"),
                  SizedBox(width: 100),
                  DropdownButton(
                    value: selectedValue,
                    focusColor: Colors.transparent,
                    items: languages
                        .map(
                          (lang) => DropdownMenuItem(
                            value: lang,
                            onTap: () {
                              if (lang == languages[0]) {
                                from = languagesCode[0];
                              } else if (lang == languages[1]) {
                                from = languagesCode[1];
                              } else if (lang == languages[2]) {
                                from = languagesCode[2];
                              } else if (lang == languages[3]) {
                                from = languagesCode[3];
                              } else if (lang == languages[4]) {
                                from = languagesCode[4];
                              } else if (lang == languages[5]) {
                                from = languagesCode[5];
                              } else if (lang == languages[6]) {
                                from = languagesCode[6];
                              } else if (lang == languages[7]) {
                                from = languagesCode[7];
                              } else if (lang == languages[8]) {
                                from = languagesCode[8];
                              }
                              setState(() {});
                            },
                            child: Text(lang),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      selectedValue = value!;
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blueGrey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black),
              ),
              child: Form(
                key: formKey,
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
                    errorStyle: TextStyle(color: Colors.white),
                  ),
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                color: Colors.indigo.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("To"),
                  SizedBox(width: 100),
                  DropdownButton(
                    value: selectedValue2,
                    focusColor: Colors.transparent,
                    items: languages
                        .map(
                          (lang) => DropdownMenuItem(
                            value: lang,
                            onTap: () {
                              if (lang == languages[0]) {
                                to = languagesCode[0];
                              } else if (lang == languages[1]) {
                                to = languagesCode[1];
                              } else if (lang == languages[2]) {
                                to = languagesCode[2];
                              } else if (lang == languages[3]) {
                                to = languagesCode[3];
                              } else if (lang == languages[4]) {
                                to = languagesCode[4];
                              } else if (lang == languages[5]) {
                                to = languagesCode[5];
                              } else if (lang == languages[6]) {
                                to = languagesCode[6];
                              } else if (lang == languages[7]) {
                                to = languagesCode[7];
                              } else if (lang == languages[8]) {
                                to = languagesCode[8];
                              }
                              setState(() {});
                            },
                            child: Text(lang),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      selectedValue2 = value!;
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blueGrey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black),
              ),
              child: Center(
                child: SelectableText(
                  data,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: translate,
              style: ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(Colors.indigo.shade900),
                fixedSize: MaterialStatePropertyAll(Size(300, 45)),
              ),
              child: isLoading
                  ? SizedBox.square(
                      dimension: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : Text(
                      'Translate',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
            ),
            SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}
