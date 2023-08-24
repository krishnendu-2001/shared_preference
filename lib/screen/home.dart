import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './login.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME'),
        backgroundColor: Color.fromARGB(255, 25, 25, 26),
        actions: [
          IconButton(
              onPressed: () {
                singout(context);
              },
              icon: Icon(Icons.exit_to_app)),
        ],
      ),
      body: SafeArea(
          child: ListView.separated(
              itemBuilder: (ctx, index) {
                return ListTile(
                  title: Text("Colour ${index + 1}"),
                  subtitle: Text("Colour name ${index + 1}"),
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage("images\1506821.jpg"),
                  ),
                );
              },
              separatorBuilder: (ctx, index) {
                return Divider();
              },
              itemCount: 10)),
    );
  }

  Future singout(BuildContext ctx) async {
    final _sharedpref = await SharedPreferences.getInstance();
    _sharedpref.clear();

    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx1) => ScreenLogin()), (route) => false);
  }
}
