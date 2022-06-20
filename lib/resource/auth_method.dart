import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grow_pet/model/user_model.dart' as model;

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //* SIGN UP METHOD

  Future<String> signUp({required String email, username, password}) async {
    String res = "Some Error Occured";

    try {
      if (email.isNotEmpty || password.isNotEmpty || username.isNotEmpty) {
        // * register an user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        // * store user data in firebase

        model.User user = model.User(
            adoptionPets: [],
            bio: '',
            donationPets: [],
            email: email,
            uid: cred.user!.uid,
            followers: [],
            following: [],
            username: username,
            photoUrl: '');

        await _firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
        res = "success";
      }
    } on FirebaseAuthException catch (err) {
      if (err.code == "weak-password") {
        res = "Create a strong password";
      } else if (err.code == "email-already-in-use") {
        res = "Email already in use";
      } else {
        res = "Invalid Email id";
      }
    } catch (error) {
      res = error.toString();
      print(error);
    }

    return res;
  }

  //* LOGIN METHOD

  Future<String> logInUser(
      {required String email, required String password}) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        _auth.signInWithEmailAndPassword(email: email, password: password);
        res = "success";
      }
    } on FirebaseAuthException catch (err) {
      if (err.code == "wrong-password") {
        res = "Wrong password";
      } else if (err.code == "user-not-found") {
        res = "User not found";
      }
    } catch (error) {
      res = error.toString();
      print(res);
    }

    return res;
  }
}
