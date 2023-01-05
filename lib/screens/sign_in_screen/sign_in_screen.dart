import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:food_app_ytm/providers/user_provider.dart';
import 'package:food_app_ytm/screens/sign_in_screen/auth_service.dart';
import '../home_screen/home_screen.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late AuthService authService;
  late UserProvider userProvider;

  @override
  void initState() {
    super.initState();
    authService = AuthService();
    userProvider = UserProvider();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/background.png'))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 400,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Vegi',
                    style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          BoxShadow(
                            blurRadius: 5,
                            color: Colors.green.shade900,
                            offset: const Offset(3, 3),
                          ),
                        ]),
                  ),
                  Column(
                    children: [
                      SignInButton(
                        Buttons.Apple,
                        text: "Sign In with Apple",
                        onPressed: () {},
                      ),
                      SignInButton(
                        Buttons.Google,
                        text: "Sign In with Google",
                        onPressed: () async {
                          await authService.googleSignUp(userProvider).then(
                                (value) =>
                                    Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => const HomeScreen(),
                                  ),
                                ),
                              );
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'By signing in you are agreeing to our',
                        style: TextStyle(color: Colors.grey[800]),
                      ),
                      const SizedBox(height: 5),
                      Text('Terms and Pricacy Policy',
                          style: TextStyle(color: Colors.grey[800]))
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
