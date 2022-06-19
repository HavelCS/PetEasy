import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;
  final String? photoUrl;
  final String username;
  final String bio;
  final List followers;
  final List following;
  final List adoptionPets;
  final List donationPets;

  const User(
      {required this.username,
      required this.uid,
      required this.photoUrl,
      required this.email,
      required this.bio,
      required this.followers,
      required this.following,
      required this.adoptionPets,
      required this.donationPets});

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "uid": uid,
        "photoUrl": photoUrl,
        "bio": bio,
        "followers": followers,
        "following": following,
        "donationPets": donationPets,
        "adoptionPets": adoptionPets,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
        username: snapshot['username'],
        uid: snapshot['uid'],
        photoUrl: snapshot['photoUrl'],
        email: snapshot['email'],
        bio: snapshot['bio'],
        followers: snapshot['followers'],
        following: snapshot['following'],
        adoptionPets: snapshot['adoptionPets'],
        donationPets: snapshot['donationPets']);
  }
}
