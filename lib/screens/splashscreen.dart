// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _opacity;
//   late Animation<double> _scale;

//   bool _isLoaded = false;

//   @override
//   void initState() {
//     super.initState();
//     _initAnimation();
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();

//     if (!_isLoaded) {
//       _isLoaded = true;
//       _startLoading();
//     }
//   }

//   void _initAnimation() {
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 1200),
//     );

//     _opacity = Tween<double>(begin: 0, end: 1).animate(_controller);
//     _scale = Tween<double>(begin: 0.8, end: 1).animate(_controller);

//     _controller.forward();
//   }

//   Future<void> _startLoading() async {
//     await _precacheImages();
//     await Future.delayed(const Duration(seconds: 2));
//     _goToNextScreen();
//   }

//   Future<void> _precacheImages() async {
//     await Future.wait([
//       precacheImage(const AssetImage('assets/image/fondo.svg'), context),
//       precacheImage(const AssetImage('assets/image/fondo2.png'), context),
//       precacheImage(const AssetImage('assets/image/google_logo.png'), context),
//     ]);
//   }

//   void _goToNextScreen() {
//     final user = FirebaseAuth.instance.currentUser;

//     if (user != null) {
//       Navigator.pushReplacementNamed(context, '/home');
//     } else {
//       Navigator.pushReplacementNamed(context, '/login');
//     }
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF0D47A1),
//       body: Center(
//         child: AnimatedBuilder(
//           animation: _controller,
//           builder: (context, child) {
//             return Opacity(
//               opacity: _opacity.value,
//               child: Transform.scale(scale: _scale.value, child: child),
//             );
//           },
//           child: Image.asset('assets/image/google_logo.png', width: 180),
//         ),
//       ),
//     );
//   }
// }
