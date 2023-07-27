class Dictionary {
   late String engWord;
   late String banWord;
   late List<String?> engSyn;
   late List<String?> banSyn;
   late List<String?> sents;

   Dictionary({
      required this.engWord,
      required this.banWord,
      required this.engSyn,
      required this.banSyn,
      required this.sents,
   });

   factory Dictionary.fromJson(Map<String, dynamic> json) {
      return Dictionary(
         engWord: json['en'] ?? '',
         banWord: json['bn'] ?? '',
         engSyn: parseEngSyn(json['en_syns']),
         banSyn: parseBnSyn(json['bn_syns']),
         sents: parseSentences(json['sents']),
      );
   }

   static List<String?> parseEngSyn(dynamic engSynJson) {
      if (engSynJson is List) {
         return List<String?>.from(engSynJson);
      } else {
         return [];
      }
   }

   static List<String?> parseBnSyn(dynamic bnSynJson) {
      if (bnSynJson is List) {
         return List<String?>.from(bnSynJson);
      } else {
         return [];
      }
   }

   static List<String?> parseSentences(dynamic sentsJson) {
      if (sentsJson is List) {
         return List<String?>.from(sentsJson);
      } else {
         return [];
      }
   }
}
