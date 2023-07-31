import 'package:flutter/material.dart';

class ShowAlertDialog{

   static void showWordDetails(BuildContext context, word) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          title: const Text('Word Details'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('English Word: ${word.en}'),
              Text('Bengali Word: ${word.bn}'),
              Text('Bengali Synonyms: ${word.bnSyns.join(', ')}'),
              Text('English Synonyms: ${word.enSyns.join(', ')}'),
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

   static void showDevInfo(BuildContext context) {
     showDialog(
       context: context,
       builder: (context) {
         return AlertDialog(
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(35.0),
           ),
           title: const Text('Developer Info',textAlign: TextAlign.center,),
           content: const Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisSize: MainAxisSize.min,
             children: [


               Text(
                   'Hello, I am Sourav Barman, a software engineering student at IIT, NSTU.  '
                       'Currently, I am undergoing Flutter training to learn mobile app development. '
                       'I am excited to announce that this is my first project, and I am publishing it on the Play Store.'
                       ' I hope you will all enjoy using it. I plan to incorporate more features in the future as this is just the beta version.',textAlign: TextAlign.justify,),
              SizedBox(height: 10,),
               Text('Version : 1.0',style: TextStyle(
                 fontWeight: FontWeight.w600,
               ),)

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