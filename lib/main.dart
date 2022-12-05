import 'package:app_upeu/drawer/navigation_home_screen.dart';
import 'package:app_upeu/theme/AppTheme.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "UpeU",
      theme: AppTheme.themeData,
      debugShowCheckedModeBanner: false,
      home: NavigationHomeScreen(),
    );
  }
}
