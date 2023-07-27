import 'package:hive/hive.dart';
part 'word.g.dart';

@HiveType(typeId: 0)
class Word {
  @HiveField(0)
  List<String> pron;

  @HiveField(1)
  String bn;

  @HiveField(2)
  String en;

  @HiveField(3)
  List<String> bnSyns;

  @HiveField(4)
  List<String> enSyns;

  @HiveField(5)
  List<String> sents;

  Word({
    required this.pron,
    required this.bn,
    required this.en,
    required this.bnSyns,
    required this.enSyns,
    required this.sents,
  });
}
