import 'package:flutter/material.dart';
import 'package:my_login_page/screen/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './login.dart';

const SAVE_KEY_NAME = 'UserLoggedIn';

class hello extends StatefulWidget {
  const hello({super.key});

  @override
  State<hello> createState() => _helloState();
}

class _helloState extends State<hello> {
  @override
  void initState() {
    checkUserLoggedIn();
    gotoLogin();
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'images/1506821.jpg',
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> gotoLogin() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
      return ScreenLogin();
    }));

 
  }
   Future<void> checkUserLoggedIn() async {
      final _sharedpref = await SharedPreferences.getInstance();

      final _userLoggedIn = _sharedpref.getBool(SAVE_KEY_NAME);
      if (_userLoggedIn == null || _userLoggedIn == false) {
        gotoLogin();
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => ScreenHome(),
        ));
      }
    }


}
