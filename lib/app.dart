import 'package:flutter/material.dart';
import 'package:flutter_unipark_client/ui/login/login_page.dart';
import 'package:flutter_unipark_client/ui/main/main_page.dart';
import 'package:flutter_unipark_client/ui/splashscreen/splash_page.dart';

void main() => runApp(
      MyApp(),
    );

class MyApp extends StatelessWidget {
  static const String _title = 'Unipark Client';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: themeData,
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => SplashscreenPage(),
        '/login': (BuildContext context) => LoginPage(),
        '/main': (BuildContext context) => MainPage()
      },
    );
  }

  var themeData = ThemeData(
    // Define the default brightness and colors.
    brightness: Brightness.light,
    primaryColor: Colors.orange,
    accentColor: Colors.orange,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.orange,
    ),
    textTheme: TextTheme(
      headline: TextStyle(
        fontSize: 72.0,
        color: Colors.black38,
      ),
      title: TextStyle(
        fontSize: 36.0,
        color: Colors.black38,
      ),
      body1: TextStyle(
        fontSize: 15.0,
        color: Colors.black38,
      ),
      caption: TextStyle(
        fontSize: 15.0,
        color: Colors.grey,
      ),
      button: TextStyle(
        color: Colors.white,
      ),
    ),
  );
}
