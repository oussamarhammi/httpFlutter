import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:requestobjet/transfer.dart';

import 'lib_http.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TextFieldScreen(),
    );
  }
}

class TextFieldScreen extends StatefulWidget {
  const TextFieldScreen({Key? key}) : super(key: key);

  @override
  State<TextFieldScreen> createState() => _TextFieldScreenState();
}

class _TextFieldScreenState extends State<TextFieldScreen> {
  final _controllerusername= TextEditingController();
  final _controllerpassword= TextEditingController();
  final dio = Dio();
  //type int
  int response=-1;
  //type complexe ( objet)
  Truc truc = Truc();

  //type liste
  List<Truc> trucs = [];


  void getHttpComplex(String nom) async {
  try{
      this.truc = await httpComplex(nom) ;
      setState(() {});
    }
    catch(e){
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erreur reseau'),
          ));
    }
  }
  void getHttpList() async {
    try{
      this.trucs = await httpList() ;
      setState(() {});
    }
    catch(e){
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erreur reseau'),
          ));
    }
  }
  void getHttp() async {
    try{
      this.response = await  httpSimple();
      setState(() {});
    }
    catch(e){
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erreur reseau'),
          ));
    }
  }

  String name= "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
              this.response.toString()
          ),
          Text(
            this.truc.name,
          ),
          Container(
            child:TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
                foregroundColor:  MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: Text("bouton pour list "),
              onPressed:(){
                getHttpList();
              },
            ),
          ),
          Container(
            child:TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
                foregroundColor:  MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: Text("bouton pour complexe "),
              onPressed:(){
                int a = 0;
                int b = a+a;
                getHttpComplex('michel');
              },
            ),
          ),
          Container(
            child:TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
                foregroundColor:  MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: Text("bouton pour simple "),
              onPressed:(){
                getHttp;
              },
            ),
          )
        ],

      ),
    );
  }
}
