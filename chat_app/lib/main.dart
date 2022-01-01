import 'package:chat_app/model/Userinfo.dart';
import './ui/views/auth/warpper.dart';
import 'package:provider/provider.dart';
import './utilities/error.dart';
import 'package:firebase_core/firebase_core.dart';
import './utilities/routes.dart';
import './utilities/theme_data.dart';
import 'package:flutter/material.dart';
import 'services/firebase_auth.dart';
import 'utilities/loading.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserData>.value(
      value: Services().user,
          child: MaterialApp(
        title: 'HOMERS Chat',
        debugShowCheckedModeBanner: false,
        home: Warpper(),
        theme: themeData(),
        routes: routes,
      ),
    );
  }
}
