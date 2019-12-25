import 'package:flutter/material.dart';
import './home_page.dart';
// import './landing_part.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'A Resume Built With Flutter',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        backgroundColor: Colors.grey[400],
        appBarTheme: AppBarTheme(color: Colors.transparent),
        scaffoldBackgroundColor: Colors.grey[300],
        fontFamily: 'Poppins',
        bottomSheetTheme:
            BottomSheetThemeData(backgroundColor: Colors.grey[500]),
      ),
      home: HomePage(),
    );
  }
}
