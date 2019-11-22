import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_unipark_client/pref_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashscreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      _selectRoute(context);
    });

    return Container(
      color: Colors.white,
      child: Center(child: _svg),
    );
  }

  final Widget _svg = SvgPicture.asset(
    'res/images/logo.svg',
    height: 200,
    width: 200,
    alignment: Alignment(0.0, 0.0),
  );

  void _selectRoute(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString(PrefConstants.TOKEN));
    if (token.isNotEmpty) {
      Navigator.pushReplacementNamed(context, '/main');
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }
}
