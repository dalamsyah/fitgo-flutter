
import 'dart:convert';

import 'package:fitgo_flutter/constant/Screen.dart';
import 'package:fitgo_flutter/screen/Route.dart';
import 'package:fitgo_flutter/screen/home/HomePage.dart';
import 'package:fitgo_flutter/widgets/Dialogs.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {

  const LoginPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var txtEditPassword = TextEditingController();
  var txtEditEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final logo = Container(
      padding: EdgeInsets.all(50.0),
      child: Image.asset('assets/images/logo2.png'),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
      controller: txtEditEmail,
      onSaved: (String? val) {
        txtEditEmail.text = val!;
      },
    );

    final password = TextFormField(
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
      controller: txtEditPassword,
      onSaved: (String? val) {
        txtEditPassword.text = val!;
      },
    );

    final buttonLogin = SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.transparent)
                  )
              )
          ),
          onPressed: () => doLogin(txtEditEmail.text, txtEditPassword.text),
          // onPressed: () {
          //   Navigator.of(context).push(routeToHome());
          // },
          child: Container(
            padding: const EdgeInsets.all(15.0),
            child: const Text('Login'),
          ),
        )
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50.0),
                logo,
                SizedBox(height: 10.0),
                email,
                SizedBox(height: 10.0),
                password,
                SizedBox(height: 10.0),
                buttonLogin,
              ],
            ),
          ),
        )
      )
    );

  }

  doLogin(email, password) async {
    final GlobalKey<State> _keyLoader = GlobalKey<State>();
    Dialogs.loading(context, _keyLoader, "Proses ...");

    try {
      final response = await http.post(
          Uri.parse("http://54.179.102.25/user/login"),
          headers: {'Content-Type': 'application/json; charset=UTF-8'},
          body: jsonEncode({
            "email": "iwan3@gmail.com",
            "password": "keb@ntenan2018",
          }));

      final output = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Navigator.of(_keyLoader.currentContext!, rootNavigator: false).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                output['message'],
                style: const TextStyle(fontSize: 16),
              )),
        );

        Navigator.pushReplacement(
          context,
          new MaterialPageRoute(
            builder: (context) => HomePage(title: 'Home'),
          ),
        );

        //debugPrint(output['message']);
      } else {
        Navigator.of(_keyLoader.currentContext!, rootNavigator: false).pop();
        //debugPrint(output['message']);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                output.toString(),
                style: const TextStyle(fontSize: 16),
              )),
        );
      }
    } catch (e) {
      Navigator.of(_keyLoader.currentContext!, rootNavigator: false).pop();
      Dialogs.popUp(context, '$e');
      debugPrint('$e');
    }
  }

  saveSession(String email) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("email", email);
    await pref.setBool("is_login", true);

  }

  void checkLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var islogin = pref.getBool("is_login");
    if (islogin != null && islogin) {
      Navigator.of(context).push(routeToHome());
    }
  }

  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

}