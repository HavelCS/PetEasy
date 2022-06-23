import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grow_pet/model/user_model.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  // * signUp method for creating an user
  Future<String> signUp(
      {required String email,
      required String password,
      String? bio,
      required String username}) async {
    String res = "Some Error Occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        // * creates an user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        // * register the user in database

        UserModel user = UserModel(
          username: username,
          email: email,
          uid: cred.user!.uid,
          bio: bio,
          followers: [],
          following: [],
        );
        await _firebaseFirestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());

        res = "success";
      }
    } on FirebaseAuthException catch (err) {
      if (err.code == 'email-already-in-use') {
        res = "email already in use";
      } else if (err.code == "weak-password") {
        res = 'Create a strong password';
      } else {
        res = "Email id not valid";
      }
    } catch (error) {
      res = error.toString();
    }
    return res;
  }

  // * LOGIN METHOD - helps the user to login into their account

  Future<String> loginUser(
      {required String email, required String password}) async {
    String res = "Some error occured";

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        _auth.signInWithEmailAndPassword(email: email, password: password);
        res = "success";
      }
    } on FirebaseAuthException catch (err) {
      if (err.code == "wrong-password") {
        res = "incorrect password";
      } else if (err.code == "user-not-found") {
        res = "incorrec email id";
      }
    } catch (error) {
      res = error.toString();
    }

    return res;
  }

  // * get current user details

  Future<UserModel> getDetails() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snapshot =
        await _firebaseFirestore.collection('users').doc(currentUser.uid).get();
    return UserModel.fromSnap(snapshot);
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
