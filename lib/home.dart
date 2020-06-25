import 'package:coronaquizapp/model/perguntas.dart';
import 'package:flutter/material.dart';


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

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Corona Quiz"),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Builder(
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
                  color: Colors.amber.shade100,
                  borderRadius: BorderRadius.circular(14.4),
                  border: Border.all(
                    color: Colors.black,
                    style: BorderStyle.solid
                  )
                ),
                height: 120.0,
                child: Center(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(questionBank[questionIndex].perguntasText, style: TextStyle(fontSize: 17),),
                )),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(onPressed: ()=> _checkReposta(true, context), color: Colors.green.shade100, child: Text("Verdadeiro")),
                RaisedButton(onPressed: ()=> _checkReposta(false, context), color: Colors.red.shade100, child: Text("Falso")),
                RaisedButton(onPressed: ()=> _proximaPergunta(), color: Colors.blue.shade100, child: Icon(Icons.arrow_forward)),
              ],
            ),
            Spacer(),
          ],
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
  _checkReposta(bool escolha, BuildContext context) {

    if (escolha == questionBank[questionIndex].correto) {
      //correct answer
      final snackbar = SnackBar(
          backgroundColor: Colors.green,
          duration: Duration(milliseconds: 1500),
          content: Text("Correto!"));
      Scaffold.of(context).showSnackBar(snackbar);
      _updateQuestion();
    } else {
      debugPrint("Incorrect!");
      final snackbar = SnackBar(
          backgroundColor: Colors.redAccent,
          duration: Duration(milliseconds: 1500),
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






