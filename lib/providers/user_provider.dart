import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  void addUserData(
      {required User currentUser,
      required String userName,
      required String userEmail,
      required String userImage}) async {
    await FirebaseFirestore.instance
        .collection('UsersData')
        .doc(currentUser.uid)
        .set({
      "userName": userName,
      "userEmail": userEmail,
      "userImage": userImage,
      "userUid": currentUser.uid
    });
  }

  // late UserModel currentUser;
  // void getUserData() async {
  //   UserModel userModel;
  //   var value = await FirebaseFirestore.instance
  //       .collection('UsersData')
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .get();

  //   if (value.exists) {
  //     UserModel userModel = UserModel(
  //         userEmail: value.get("userEmail"),
  //         userImage: value.get("userImage"),
  //         userName: value.get("userName"),
  //         userUid: value.get("userUid"));
  //     currentUser = userModel;
  //     notifyListeners();
  //   }
  // }
  // UserModel get getCurrentUserData{
  //   return currentUser;
  // }
}
