
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => _HomePage();

}

class _HomePage extends State<HomePage> {

  TextEditingController nameController = TextEditingController();
  String fullName = '';

  @override
  Widget build(BuildContext context) {

    final logo = Container(
      padding: EdgeInsets.all(50.0),
      child: Image.asset('assets/images/logo2.png'),
    );

    final buttonDetail = SizedBox(
        child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.transparent)
                  )
              )
          ),
          onPressed: () => null,
          child: Container(
            padding: const EdgeInsets.all(15.0),
            child: const Text('Login'),
          ),
        )
    );

    final card = Card(
      child: Column(
        children: [
          logo,
          Container(
            padding: EdgeInsets.all(10.0),
            child: 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Walang futsal'),
                    Text('Jln Raya Walang no.12'),
                    SizedBox(height: 10.0),
                    Text('Available: Sintetis, Vinyl'),
                  ],
                ),

                Column(
                  children: [
                    Text('1.25 Km'),
                    SizedBox(height: 10.0),
                    buttonDetail,
                  ],
                ),


              ],
            ),
          )
        ],
      ),
    );

    final containerCard = Container(
      width: 330.0,
      height: 50.0,
      padding: EdgeInsets.all(10.0),
      child: card,
    );

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        width: double.infinity,
        height: 330.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return containerCard;
          },
          itemCount: 5,
        ),
      )
    );

  }

}