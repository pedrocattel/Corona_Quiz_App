import 'package:coronaquizapp/model/perguntas.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class corona_quiz extends StatefulWidget {
  @override
  _corona_quizState createState() => _corona_quizState();
}

class _corona_quizState extends State<corona_quiz> {

  int questionIndex = 0;

  List questionBank = [
    Perguntas.name("O Corona vírus é transmitido pelo ar?", true),
    Perguntas.name("O distânciamento social se provou eficaz?", true),
    Perguntas.name("Estar infectado significa ter os sintomas?", false),
    Perguntas.name("Existe uma grande quantidade de fake news a solta?", true),
    Perguntas.name("O corona vírus é inofensivo como qualquer outra gripe?", false),
    Perguntas.name("O governo disponbilizou um site repleto de informações da pandemia?", true),
    Perguntas.name("Só devo sair de caso em último caso?", true),
    Perguntas.name("Posso visitar meus familiares durante a quarentena?", false),
    Perguntas.name("Praticar atividades físicas é essêncial durante a pandemia?", true),
    Perguntas.name("Devo lavar as mãos de duas em duas horas?", true),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Corona Quiz", style: GoogleFonts.lato(),),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Colors.blue,
                    Colors.deepPurple.shade300
                  ])
          ),
        ),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.deepPurple, Colors.blue],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft
            )
          ),
          child: Builder(
            builder: (BuildContext context) => Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                    child:
                    Image.asset("images/Corona.png", width: 250, height: 180)
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(14.4),
                      border: Border.all(
                        color: Colors.deepPurple,
                        style: BorderStyle.solid
                      )
                    ),
                    height: 120.0,
                    child: Center(child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(questionBank[questionIndex].perguntasText, style: GoogleFonts.lato(fontSize: 18)),
                    )),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ButtonTheme(
                      minWidth: 150.0,
                      height: 50.0,
                      child: RaisedButton(onPressed: ()=> _checkReposta(true, context), color: Colors.green.shade400, child: Text("Verdadeiro", style: GoogleFonts.lato(fontSize: 18))),
                    ),
                    ButtonTheme(
                      minWidth: 150.0,
                      height: 50.0,
                        child: RaisedButton(onPressed: ()=> _checkReposta(false, context), color: Colors.red.shade400, child: Text("Falso", style: GoogleFonts.lato(fontSize: 18))),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ButtonTheme(
                        minWidth: 150.0,
                        height: 50.0,
                        child: RaisedButton(
                            onPressed: ()=> _anteriorPergunta(),
                            color: Colors.blue.shade200,
                            child: Icon(Icons.arrow_back)),
                      ),
                      ButtonTheme(
                        minWidth: 150.0,
                        height: 50.0,
                        child: RaisedButton(
                            onPressed: ()=> _proximaPergunta(),
                            color: Colors.blue.shade200,
                            child: Icon(Icons.arrow_forward)),
                      )
                    ],
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
    ),
        ),
      ),
    );
  }

  _proximaPergunta() {
    setState(() {
      questionIndex = (questionIndex + 1) % questionBank.length;
    });
  }

  _anteriorPergunta() {
    setState(() {
      questionIndex = (questionIndex - 1) % questionBank.length;
      debugPrint("Index: $questionIndex");
    });
  }

  _checkReposta(bool escolha, BuildContext context) {

    if (escolha == questionBank[questionIndex].correto) {
      final snackbar = SnackBar(
          backgroundColor: Colors.green,
          duration: Duration(milliseconds: 700),
          content: Text("Correto!"));
      Scaffold.of(context).showSnackBar(snackbar);
      _updateQuestion();
    } else {
      debugPrint("Incorreto!");
      final snackbar = SnackBar(
          backgroundColor: Colors.redAccent,
          duration: Duration(milliseconds: 700),
          content: Text("Incorreto!"));
      Scaffold.of(context).showSnackBar(snackbar);

      _updateQuestion();
    }

  }

  _updateQuestion() {
    setState(() {
      questionIndex = (questionIndex + 1) % questionBank.length;
    });
  }

}






