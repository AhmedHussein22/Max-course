import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_map/provider/fetch_locations.dart';
import 'package:google_map/util/custom_route.dart';
import 'package:google_map/view/location_list.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: FetchLocatins(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ListOfLOcation(),
        initialRoute: "/home",
        title: 'Google Maps',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          primaryColor: Colors.purple,
          pageTransitionsTheme: PageTransitionsTheme(
            builders: {
              TargetPlatform.android: CustomPageTransitionBuilder(),
              TargetPlatform.iOS: CustomPageTransitionBuilder(),
            },
          ),
        ),
        routes: {
          "/home":(context)=>ListOfLOcation()
        },
      ),
    );
  }
}
