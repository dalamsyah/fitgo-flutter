
import 'package:fitgo_flutter/constant/Screen.dart';
import 'package:fitgo_flutter/screen/Route.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {

  const RegisterPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => _RegisterPage();

}

class _RegisterPage extends State<RegisterPage> {

  TextEditingController nameController = TextEditingController();
  String fullName = '';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Container(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(5.0),
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Alamat Email',
                    ),
                    onChanged: (text) {
                      setState(() {
                        fullName = text;
                        debugPrint('debuggg $fullName');
                        print('print $fullName');
                        //you can access nameController in its scope to get
                        // the value of text entered as shown below
                        // fullName = nameController.text;
                      });
                    },
                  ),
                ),

                Container(
                  margin: const EdgeInsets.all(5.0),
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nama',
                    ),
                    onChanged: (text) {
                      setState(() {

                      });
                    },
                  ),
                ),

                Container(
                  margin: const EdgeInsets.all(5.0),
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nama Tim',
                    ),
                    onChanged: (text) {
                      setState(() {

                      });
                    },
                  ),
                ),

                Container(
                  margin: const EdgeInsets.all(5.0),
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'No Handphone',
                    ),
                    onChanged: (text) {
                      setState(() {

                      });
                    },
                  ),
                ),

                Container(
                  margin: const EdgeInsets.all(5.0),
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                    onChanged: (text) {
                      setState(() {

                      });
                    },
                  ),
                ),

                Container(
                  margin: const EdgeInsets.all(5.0),
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Konfirmasi Password',
                    ),
                    onChanged: (text) {
                      setState(() {

                      });
                    },
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(10.0),
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 2,
                        padding: EdgeInsets.all(5.0)
                      ),
                      onPressed: () {
                        // Navigator.pushNamed(context, Screen.HOME);
                        Navigator.of(context).push(createRoute());
                      },
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        child: Text('Register'),
                      )
                  ),
                ),

              ],
            ),
          ),
        )
      )
    );

  }

}