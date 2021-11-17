import 'package:flutter/material.dart';
import 'package:quizz/widgets/text_utils.dart';
import 'package:quizz/widgets/quizz_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: new Card(
                elevation: 8.0,
                child: new Container(
                    height: MediaQuery.of(context).size.width * 0.7,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: new Image.asset('asserts/quizz_cover.jpg',
                        fit: BoxFit.cover)),
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: new ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (BuildContext context) {
                      return new QuizzPage();
                    }));
                  },
                  child:
                      new TextUtils('DEMARRER LE QUIZZ', color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}
