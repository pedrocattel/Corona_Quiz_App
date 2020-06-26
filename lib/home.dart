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
              Card(child: ListTile(title: Text(''))),
              Card(child: ListTile(title: Text('Governo do Brasil'))),
              Card(child: ListTile(title: Text('Estatísticas Globais'))),
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
                'Aplicativo desenvolvido com o intuito de ajudar a população durante a pandêmia, em caso grave procure as autoridades!',
                style: GoogleFonts.lato(fontSize: 16,color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _launchURL() async {
    const url = 'https://uol.com.br';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}