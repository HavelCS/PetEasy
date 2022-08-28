import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grow_pet/model/adoption_model.dart';
import 'package:grow_pet/model/services_model.dart';
import 'package:grow_pet/resource/storage_method.dart';

import 'package:uuid/uuid.dart';

class FireStoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // * functions help to upload the post

  Future<String> uploadAdoption(
      String description,
      Uint8List file,
      String uid,
      String ownerName,
      String age,
      String breed,
      String gender,
      String petName,
      String petType) async {
    // asking uid here because we dont want to make extra calls to firebase auth when we can just get from our state management
    String res = "Some error occurred";
    try {
      String photoUrl =
          await StorageMethods().uploadImagetoStorage('posts', file, true);
      String postId = const Uuid().v1(); // creates unique id based on time
      AdoptionModel adoption = AdoptionModel(
        description: description,
        uid: uid,
        ownerName: ownerName,
        postId: postId,
        datePublished: DateTime.now(),
        petImage: photoUrl,
        age: age,
        breed: breed,
        gender: gender,
        petName: petName,
        petType: petType,
      );
      _firestore.collection('adoptions').doc(postId).set(adoption.toJson());
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> uploadServices(
      {required String uid,
      required String username,
      required String description,
      required Uint8List shopImage,
      required List<String> tags,
      String? serviceType,
      required String petCareName}) async {
    String res = "some error occured";

    try {
      if (description.isNotEmpty ||
          petCareName.isNotEmpty ||
          shopImage.isNotEmpty ||
          tags.isNotEmpty) {
        String photoUrl = await StorageMethods()
            .uploadImagetoStorage("servicesImage", shopImage, true);
        String postId = const Uuid().v1();

        ServiceModel service = ServiceModel(
            uid: uid,
            username: username,
            description: description,
            petCareName: petCareName,
            serviceType: serviceType,
            shopImage: photoUrl,
            tags: tags,
            postId: postId);

        _firestore.collection('services').doc(postId).set(service.toJson());

        res = "success";
      }
    } catch (error) {
      res = error.toString();
    }
    return res;
  }

  // Post comment
  Future<String> postComment(
    String postId,
    String text,
    String uid,
    String name,
  ) async {
    String res = "Some error occurred";
    try {
      if (text.isNotEmpty) {
        // if the likes list contains the user uid, we need to remove it

        String commentId = const Uuid().v1();
        await _firestore
            .collection('posts')
            .doc(postId)
            .collection('comments')
            .doc(commentId)
            .set({
          'name': name,
          'uid': uid,
          'text': text,
          'commentId': commentId,
          'datePublished': DateTime.now(),
        });
        res = 'success';
      } else {
        res = "Please enter text";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> deletePost(String postId) async {
    String res = "Some error occurred";
    try {
      await _firestore.collection('posts').doc(postId).delete();
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
