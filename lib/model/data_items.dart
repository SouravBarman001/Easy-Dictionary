// ignore_for_file: non_constant_identifier_names

class DataItem {

  final String id;
  final String name;
  final int age;
  final List<String> places;

  DataItem( {required this.places,required this.id, required this.name, required this.age});

  factory DataItem.fromJson(Map<String,dynamic> json){
    return DataItem(
        id: json['id'],
        name: json['name'],
        age: json['age'],
        places:parsePlaces(json['places']) );//json['places']
  }


  static List<String> parsePlaces(placeJson){

    List<String> placesList = List<String>.from(placeJson);
    return placesList;

  }

}
