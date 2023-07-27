// ignore_for_file: non_constant_identifier_names

class DataItem {

  final String id;
  final String name;
  final int age;
  final List<String> places;
  final List<Images> images;

  DataItem({required this.images,required this.places,required this.id, required this.name, required this.age});

  factory DataItem.fromJson(Map<String,dynamic> json){
    return DataItem(
        id: json['id'],
        name: json['name'],
        age: json['age'],
        places:parsePlaces(json['places']),
        images: parseImages(json));//json['places']
  }


  static List<String> parsePlaces(placeJson){
    List<String> placesList = List<String>.from(placeJson);
    return placesList;
  }

  static List<Images> parseImages(imagesJson){
    var list = imagesJson['images'] as List;

    List<Images> imageList = list.map((e) => Images.fromJson(e)).toList();
    return imageList;

  }

}

class Images{
  int id;
  String imgName;

 Images( {required this.id,required this.imgName});

 factory Images.fromJson(Map<String,dynamic> parsedJson){
   return Images(
       id: parsedJson['id'] ?? '',
       imgName: parsedJson['name'] ?? ''
   );
 }

}
