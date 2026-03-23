import 'package:flutter/material.dart';
import 'package:imc_calculador/components/header_imc.dart';
import 'package:imc_calculador/components/login_button.dart';
import 'package:imc_calculador/core/app_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:imc_calculador/screens/home_screen.dart';

class LoginScreens extends StatefulWidget {
  const LoginScreens({super.key});

  @override
  State<LoginScreens> createState() => _LoginScreensState();
}

class _LoginScreensState extends State<LoginScreens> {
  Future signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) return;

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderIMC(),
            SizedBox(height: 10),

            SizedBox(
              child: Column(
                children: [
                  Text(
                    "Bienvenido a la",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Calculadora de ",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ImcText(color: Color(0xFF126BB4)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Inicia sesión para continuar",
                        style: TextStyle(
                          fontSize: 18,

                          color: const Color(0xFF838383),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 10),
            LoginButton(
              onPressed: () async {
                await signInWithGoogle();
              },
            ),
            SizedBox(height: 25),
            Text(
              "Cuida tu salud, ¡vive mejor!",
              style: TextStyle(
                fontSize: 18,
                color: const Color.fromARGB(255, 71, 71, 71),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
