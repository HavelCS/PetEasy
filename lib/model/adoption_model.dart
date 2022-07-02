import 'package:cloud_firestore/cloud_firestore.dart';

class AdoptionModel {
  String petName;
  String petType;
  String breed;
  String age;
  String gender;
  String description;
  String petImage;
  String ownerName;
  DateTime datePublished;
  String postId;
  String uid;

  AdoptionModel(
      {required this.petName,
      required this.age,
      required this.breed,
      required this.description,
      required this.gender,
      required this.petType,
      required this.ownerName,
      required this.petImage,
      required this.postId,
      required this.uid,
      required this.datePublished});
  static AdoptionModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return AdoptionModel(
        petName: snapshot["petName"],
        petType: snapshot["petType"],
        breed: snapshot["breed"],
        age: snapshot["age"],
        gender: snapshot["gender"],
        description: snapshot["description"],
        ownerName: snapshot['ownerName'],
        petImage: snapshot['petImage'],
        datePublished: snapshot['dataPublised'],
        uid: snapshot['uid'],
        postId: snapshot['datePublised']);
  }

  Map<String, dynamic> toJson() => {
        "petName": petName,
        "petType": petType,
        "breed": breed,
        "age": age,
        "gender": gender,
        "description": description,
        "ownerName": ownerName,
        "petImage": petImage,
        "dataPublised": datePublished,
        "postId": postId,
        "uid": uid
      };
}
