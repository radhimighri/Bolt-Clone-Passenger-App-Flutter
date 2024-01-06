import 'dart:io';
import 'dart:async';

import 'package:cab_rider/dataproviders/appdata.dart';
import 'package:cab_rider/globalvariables.dart';
import 'package:cab_rider/screens/loginpage.dart';
import 'package:cab_rider/screens/mainpage.dart';
import 'package:cab_rider/screens/registrationpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final FirebaseApp app = await Firebase.initializeApp(
    name: 'db2',
    options: Platform.isIOS
        ? const FirebaseOptions(
            appId: '1:784303276461:ios:e074496838992edfd82124',
            apiKey: 'AIzaSyCM-RJyPvjmEFEi5RInptmaFCfgjDIELCA',
            projectId: 'flutter-firebase-plugins',
            messagingSenderId: '784303276461',
            databaseURL:
                'https://geetaxi-24ea3-default-rtdb.europe-west1.firebasedatabase.app',
          )
        : const FirebaseOptions(
            appId: '1:784303276461:android:0666fe7d2a396070d82124',
            apiKey: 'AIzaSyB-DXDM28-apXG86HbxwKu6Q7ZI7V0BqS4',
            messagingSenderId: '297855924061',
            projectId: 'flutter-firebase-plugins',
            databaseURL:
                'https://geetaxi-24ea3-default-rtdb.europe-west1.firebasedatabase.app',
          ),
  );

  currentFirebaseUser = await FirebaseAuth.instance.currentUser;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppData(),
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Brand-Regular',
          primarySwatch: Colors.blue,
        ),
        initialRoute:
            (currentFirebaseUser == null) ? LoginPage.id : RegistrationPage.id,
        routes: {
          RegistrationPage.id: (context) => RegistrationPage(),
          LoginPage.id: (context) => LoginPage(),
          MainPage.id: (context) => MainPage()
        },
      ),
    );
  }
}
