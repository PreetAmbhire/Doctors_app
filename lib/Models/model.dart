import 'dart:convert';

List<Model> modelFromJson(String str) =>
    List<Model>.from(json.decode(str).map((x) => Model.fromJson(x)));

class Model {
  late int id;
  late String name;
  late String speciality;
  late String image;
  late String location;
  late String experience;
  late double rating;

  Model(
      {required this.id,
      required this.name,
      required this.speciality,
      required this.image,
      required this.location,
      required this.experience,
      required this.rating});

  Model.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    speciality = json["Specialists"];
    image = json["imageUrl"];
    location = json["City"];
    experience = json["Experience"];
    rating = json["id`"];
  }
}
