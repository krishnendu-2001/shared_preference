import 'package:flutter/material.dart';
import 'package:my_login_page/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './home.dart';

class ScreenLogin extends StatefulWidget {
  ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isDataMatched = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Username',
                  ),
                  validator: (value) {
                    // if (_isDataMatched) {
                    //   return null;
                    // } else {
                    //   return 'ERROR';
                    // }
                    if (value == null || value.isEmpty) {
                      return 'Value is Empty';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                  ),
                  validator: (value) {
                    //   // if (_isDataMatched) {
                    //   //   return null;
                    //   // } else {
                    //   //   return 'ERROR';
                    //   // }
                    if (value == null || value.isEmpty) {
                      return 'Value is Empty';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                        visible: !_isDataMatched,
                        child: Text(
                          'Username Password doesnot match',
                          style: TextStyle(color: Colors.red),
                        )),
                    ElevatedButton.icon(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          checkLogin(context);
                        } else {
                          print('Data empty');
                        }
                      },
                      icon: Icon(Icons.check),
                      label: Text('Login'),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void checkLogin(BuildContext ctx) async {
    final _username = _usernameController.text;
    final _password = _passwordController.text;
    if (_username == _password) {
      //gotohome
      final _sharedpref = await SharedPreferences.getInstance();

     _sharedpref.setBool(SAVE_KEY_NAME, true);
      Navigator.of(ctx)
          .pushReplacement(MaterialPageRoute(builder: (ctx) => ScreenHome()));
    } else {
      final _errormessage = ('Username and password does not match ');
      showDialog(
          context: ctx,
          builder: (ctx1) {
            return AlertDialog(title: Text("ERROR"), actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(ctx1).pop();
                  },
                  child: Text("CLOSE"))
            ]);
          });
      setState(() {
        _isDataMatched = false;
      });
    }
  }
}
