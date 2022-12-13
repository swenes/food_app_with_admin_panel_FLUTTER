import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app_ytm/providers/user_provider.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  Future<User?> googleSignUp(UserProvider userProvider) async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );
      final FirebaseAuth auth = FirebaseAuth.instance;

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final User? user = (await auth.signInWithCredential(credential)).user;

      userProvider.addUserData(
          currentUser: user!,
          userName: user.displayName ?? 'null isim',
          userEmail: user.email ?? 'null email',
          userImage: user.photoURL ?? 'null photoUrl');

      return user;
    } catch (e) {
      Center(
        child: Text(e.toString()),
      );
    }
    return null;
  }
}
