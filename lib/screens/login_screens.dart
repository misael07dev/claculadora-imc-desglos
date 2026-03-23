import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                HeaderIMC(),

                SizedBox(height: 10.h),

                // TEXTOS
                Column(
                  children: [
                    Text(
                      "Bienvenido a la",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 5.h),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            "Calculadora de ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 25.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ImcText(color: const Color(0xFF126BB4)),
                      ],
                    ),

                    SizedBox(height: 5.h),

                    Text(
                      "Inicia sesión para continuar",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: const Color(0xFF838383),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20.h),

                // BOTÓN LOGIN
                LoginButton(
                  onPressed: () async {
                    await signInWithGoogle();
                  },
                ),

                SizedBox(height: 25.h),

                Text(
                  "Cuida tu salud, ¡vive mejor!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: const Color.fromARGB(255, 71, 71, 71),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
