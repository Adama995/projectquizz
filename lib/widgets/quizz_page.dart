import 'package:flutter/material.dart';
import 'package:quizz/widgets/text_utils.dart';
import 'package:quizz/modele/questions.dart';
import 'dart:async';

class QuizzPage extends StatefulWidget {
  @override
  _QuizzPageState createState() => new _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  Question question;
  List<Question> listQuestion = [
    new Question('ZIDANE A MARQUE 3 BUTS LORS DE LA FINALE DE LA CDM 1998', false,
        'ZIDANE A MARQUE 2 BUTS LORS DE CETTE FINALE', 'zizou.png'),
    new Question('HARRY POTTER OBTIENT SON PREMIER BALAIS A 11 ANS', true,
        'VRAI HARRY POTTER OBTIENT SON BALAIS A 11 ANS', 'harry-potter.png'),
    new Question('JOHNNY HALLIDAY EST MORT EN 2017', true,
        'JOHNNY EST EN EFFET MORT LE 5 DECEMBRE 2017', 'johnny.png'),
    new Question('JACQUES CHIRAC A PRESIDE LA FRANCE DE 1995 A 2007', true,
        'LE MANDAT DE JACQUES CHIRAC A BIEN ETE DE 1995 A 2007', 'chirac.png'),
    new Question('LES CREATEURS DE PUMA ET ADIDAS SONT FRERES', true,
        'RUDOLF DASSLER A CREE PUMA ET SON FRERE ADOLF ADIDAS', 'puma.png'),
    new Question('LE LOGO DE LAMBORGHINI EST UN CHEVAL', false,
        'FERRARI A UN CHEVAL POUR LOGO TANDIS QUE LAMBORGHINI A UN TAUREAU', 'lambo.png'),
    new Question('IL EST LEGAL DE POSSEDER UN TIGRE EN ARABIE SAOUDITE', false,
        'FAUX CELA A ETE INTERDIT EN JANVIER 2017', 'tigre.png'),
    new Question('DAKAR EST LA CAPITALE DU SENEGAL', true,
        'DAKAR EST BIEN LA CAPITALE DU SENEGAL', 'dakar.jpg'),
    new Question('IL Y A AUCUN PANNEAU STOP DANS PARIS', true,
        'IL Y A ZERO PANNEAU STOP DANS PARIS DEPUIS 2013', 'stop.png'),
    new Question(
        'DES CHERCHEURS ONT DECOUVERT LE FOSSIL DE DINOSAURES CRACHEURS DE FEU', true,
        'AUCUN FOSSIL DE CE TYPE A ETE DECOUVERT', 'dino.png'),
  ];

  int index = 0;
  int score = 0;

  @override
  void initState() {
    super.initState();
    question = listQuestion[index];
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width * 0.5;
    return new Scaffold(
      appBar: new AppBar(
        title: new TextUtils('PARTIE DE QUIZZ'),
      ),
      body: new Center(
          child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: new TextUtils('Question #${index + 1}',
                  color: Colors.grey[900])),
          Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: new TextUtils('Score : $score / ${index + 1}',
                  color: Colors.grey[900])),
          Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: new Card(
                elevation: 8.0,
                child: new Container(
                  height: size,
                  width: size,
                  child: new Image.asset(
                    'asserts/' + question.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              )),
          Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: new TextUtils(question.question,
                  color: Colors.grey[900], textScalefactor: 1.3)),
          Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  boutonBool(true),
                  boutonBool(false),
                ],
              ))
        ],
      )),
    );
  }

  ElevatedButton boutonBool(bool b) {
    return new ElevatedButton(
      //elevation: 8.0,
      onPressed: (() => dialog(b)),
      // color: Colors.green,
      child: TextUtils(b ? "Vrai" : "Faux", color: Colors.white),
    );
  }

  Future<Null> dialog(bool b) async {
    bool bonneReponse = (b == question.reponse);
    String vrai = "asserts/true.png";
    String faux = "asserts/false.png";
    if (bonneReponse) {
      score++;
    }

    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: new SimpleDialog(
                title: new TextUtils(
                  bonneReponse
                      ? "FELICITATIONS, BONNE REPONSE !"
                      : "MAUVAISE REPONSE !",
                  textScalefactor: 1.2,
                  color: bonneReponse ? Colors.green : Colors.redAccent,
                ),
                contentPadding: EdgeInsets.all(10.0),
                children: <Widget>[
                  Flexible(
                      flex: 1,
                      fit: FlexFit.loose,
                      child: new Image.asset(bonneReponse ? vrai : faux,
                          fit: BoxFit.cover)),
                  Flexible(
                      flex: 1,
                      fit: FlexFit.loose,
                      child: new Container(height: 20.0)),
                  Flexible(
                      flex: 1,
                      fit: FlexFit.loose,
                      child: new TextUtils(question.explication,
                          textScalefactor: 1.1, color: Colors.grey[900])),
                  Flexible(
                      flex: 1,
                      fit: FlexFit.loose,
                      child: new Container(height: 20.0)),
                  new ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      getNextQuestion();
                    },
                    //color: Colors.green,
                    child: new TextUtils('QUESTIONS SUIVANTES',
                        color: Colors.white, textScalefactor: 1.2),
                  )
                ]),
          );
        });
  }

  Future<Null> alerte() async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext buildContext) {
          return AlertDialog(
            title: new TextUtils('FIN DU QUIZZ MERCI A BIENTOT',
                color: Colors.green, textScalefactor: 1.2),
            contentPadding: EdgeInsets.all(10.0),
            content: new TextUtils("VOTRE SCORE EST DE : $score/${index + 1}",
                color: Colors.grey[900]),
            actions: <Widget>[
              Flexible(
                  flex: 1,
                  fit: FlexFit.loose,
                  child: new TextButton(
                      onPressed: (() {
                        Navigator.pop(buildContext);
                        Navigator.pop(context);
                      }),
                      child: new TextUtils("FIN",
                          textScalefactor: 1.0, color: Colors.green)))
            ],
          );
        });
  }

  void getNextQuestion() {
    if (index < listQuestion.length - 1) {
      index++;
      setState(() {
        question = listQuestion[index];
      });
    } else {
      alerte();
    }
  }
}
