import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hive/hive.dart';

import '../controller/data_item_controller.dart';
import '../hivedb/word.dart';
class DictionaryApp extends StatefulWidget {
  const DictionaryApp({super.key});

  @override
  State<DictionaryApp> createState() => _DictionaryAppState();
}

class _DictionaryAppState extends State<DictionaryApp> {
  List<dynamic> searchResults = [];
  final TextEditingController textEditingController = TextEditingController();
  // ignore: prefer_typing_uninitialized_variables
  var words;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DataItemController dataItemController = DataItemController();
    dataItemController.storeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dictionary App'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: InkWell(
                  onTap: (){
                    setState(() {
                     //  final box = Hive.box<Word>('dataBox');
                     // var wordResults = box.values.where((word) => word.en.toLowerCase().contains(query.toLowerCase())).toList();
                     // print("value : $wordResults");
                      setState(() {
                        words = textEditingController.text.toString();
                        print('Search word $words');
                        // Perform search operation based on the "en" field
                        final box = Hive.box<Word>('dataBox');
                        searchResults = box.values.where((word) => word.en.toLowerCase().contains(words.toLowerCase())).toList();
                        print(searchResults);
                      });

                    });
                  },
                    child: const Icon(Icons.search)),
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                final word = searchResults[index];
                final bnSynonymsDisplay = word.bnSyns.join(', ');
                final enSynonymsDisplay = word.enSyns.join(', ');
                final sentsDisplay = word.sents.join('</br></br>');



                return ListTile(
                  title: Text(word.en), // Display English word
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Bengali: ${word.bn}'), // Display Bengali word
                      Text('Bengali Synonyms: $bnSynonymsDisplay'), // Display Bengali synonyms
                      Text('English Synonyms: $enSynonymsDisplay'), // Display English synonyms
                      Html(
                        data: sentsDisplay,
                      )
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.info,color: Colors.black,),
                    onPressed: () {
                      // Handle button click to show word details
                      _showWordDetails(word);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
  void _showWordDetails(Word word) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Word Details'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('English Word: ${word.en}'),
              Text('Bengali Word: ${word.bn}'),
              Text('Bengali Synonyms: ${word.bnSyns.join(', ')}'),
              Text('English Synonyms: ${word.enSyns.join(', ')}'),
             // Text('English Synonyms: ${word.enSyns.join(', ')}'),


            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}



