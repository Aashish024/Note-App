import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_fire2/Screens/login.dart';
import 'package:flutter_fire2/Screens/home_screen.dart';
import 'package:flutter_fire2/firebase_options.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
  // runApp(const GetMaterialApp(
  //   debugShowCheckedModeBanner: false,
  //   title: 'Note App',
  //   home: MyApp(),
  // ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  User? user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    print(user?.email.toString());
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
    title: "Note App",
    debugShowCheckedModeBanner: false,
    home: user != null ? const HomeScreen() : const LoginScreen(),
    builder: EasyLoading.init(),
  );
  }
}

