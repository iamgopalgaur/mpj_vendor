import 'package:flutter/material.dart';
import 'package:mpj_vendor/screens/login_screen.dart';
import 'package:mpj_vendor/screens/login_screen_2.dart';
import 'package:mpj_vendor/screens/otp.dart';
import 'package:mpj_vendor/screens/phone.dart';
import 'package:mpj_vendor/screens/vendor_form_1.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MPJ Vendor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PhoneScreen(),
    );
  }
}
