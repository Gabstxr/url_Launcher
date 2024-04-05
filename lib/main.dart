import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';
 
void main() {
  runApp(const MyWidget());
}
 
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter URL Launcher',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Url Launcher'),
    );
  }
}
 
class MyHomePage extends StatefulWidget {
  final String title;
 
  const MyHomePage({super.key, red, required this.title});
 
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
 
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.amberAccent,
                backgroundColor: Colors.red),
              onPressed: abrirGmail,
              child: const Text('Abrir  o Gmail'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.amberAccent,
                  backgroundColor: Colors.red),
              onPressed: fazerLigacao,
              child: const Text('Fazer uma ligação',
              ),
            ),
 
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.amberAccent,
                backgroundColor: Colors.red),
              onPressed: enviarSMS,
              child: const Text('Enviar SMS',
            )
            )
          ],
        ),
      )
    );
  }
 
  void abrirGmail() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'geoogabrielle@gmail.com',
      query: 'subject=Reportar&body=Detalhes do erro: ');
    String url = params.toString();
 
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      if (kDebugMode) {
        print('Could not launch $url');
      }
    }
  }
 
  void fazerLigacao() async {
    const url = 'tel:11956841947';
 
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
 
  void enviarSMS() async {
    const url = 'sms:11956841947?Olá, tudo bem?';
 
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
}