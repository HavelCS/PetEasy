import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String email, uid, username;
  String? bio;
  List? followers, following;
  //*  UserModel constructor
  UserModel(
      {this.bio,
      required this.email,
      this.followers,
      this.following,
      required this.uid,
      required this.username});

  static UserModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return UserModel(
      username: snapshot["username"],
      uid: snapshot["uid"],
      email: snapshot["email"],
      bio: snapshot["bio"],
      followers: snapshot["followers"],
      following: snapshot["following"],
    );
  }

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "email": email,
        "bio": bio,
        "followers": followers,
        "following": following,
      };
}
