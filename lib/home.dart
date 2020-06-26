import 'package:coronaquizapp/quiz.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Corona Help Brasil", style: GoogleFonts.lato()),
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
        drawer: _homeDrawer(),
        body:
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.deepPurple, Colors.blue],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft
              )
          ),
          padding: EdgeInsets.all(12.0),
          child: ListView(
            children: <Widget>[
              Container(
                padding:EdgeInsets.only(left: 20),
                child: Text("Fontes verificadas",style: GoogleFonts.lato(fontSize: 24, color: Colors.white),textAlign: TextAlign.start,),
              ),
              Divider(
                color: Colors.white,
                height: 15,
                thickness: 2,
                indent: 17,
                endIndent: 30,
              ),
              Card(child: ListTile(title: Text('Estatísticas Globais',style: GoogleFonts.lato()),onTap: _launchURLstat)),
              Card(child: ListTile(title: Text('Governo do Brasil',style: GoogleFonts.lato()),onTap: _launchURLgoverno)),
              Card(child: ListTile(title: Text('Ministério da Saúde',style: GoogleFonts.lato()),onTap: _launchURLministerio)),
              Card(child: ListTile(title: Text('Nações Unidas',style: GoogleFonts.lato()),onTap: _launchURLnacoes)),
            ],
          ),
        )
    );
  }

  _homeDrawer() {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.deepPurple, Colors.blue],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft
            )
        ),
        child: ListView(
          padding: EdgeInsets.only(top: 20.0),
          children: <Widget>[
            ListTile(
              trailing: Icon(Icons.assignment_turned_in,color: Colors.white),
              title: Text(
                'Corona Quiz',
                  style: GoogleFonts.lato(fontSize: 16,color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return corona_quiz();
                }));
              },
            ),
            Divider(
              color: Colors.black,
              height: 15,
              thickness: 1.5,
              indent: 20,
              endIndent: 20,
            ),
            ListTile(
              title: Text(
                'Aplicativo desenvolvido com o intuito de ajudar a população durante a pandêmia, em caso de sintomas graves procure as autoridades!',
                style: GoogleFonts.lato(fontSize: 16,color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _launchURLgoverno() async {
    const url = 'https://covid.saude.gov.br/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURLstat() async {
    const url = 'https://corona.help/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURLnacoes() async {
    const url = 'https://nacoesunidas.org/tema/coronavirus/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURLministerio() async {
    const url = '  https://coronavirus.saude.gov.br/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}