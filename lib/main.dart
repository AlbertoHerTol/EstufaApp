import 'package:flutter/material.dart';
import 'MisComponentes.dart';
import 'package:http/http.dart' as http; // tools-flutter- flutter pub get
import 'dart:convert';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  //MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  //-------------------Variables relacionadas con el json y su obtención
  String _server = 'http://192.168.56.1:8008/hello/';
  var objJson;
  String ms;
  //-------------------LLaves
  GlobalKey<InicioState> kInicio = new GlobalKey();
  //-------------------Otras variables
  String mostrar="Inicio";


  _MyHomePageState(){
    print('Constructor MyHomePage');

    consultar().then((x){
      print('Entrando en then()');
      setState((){
        ms=x;
      });
      print('Entro en decode');
      objJson=jsonDecode(ms);
      print("La TEMPERATURA AMBIENTE ES: "+objJson["estufa"]["estado"]["TemperaturaAmbiente"].toString());
      kInicio.currentState.repaint(objJson);
    });// la funcion asincrona usa then

  }



  Future<String> consultar() async {
    print("Lanza la consulta a  --> "+_server);
    var respuesta = await http.get(_server); //await para que espere
    // sample info available in response
    int statusCode = respuesta.statusCode;
    Map<String, String> headers = respuesta.headers;
    String contentType = headers['content-type'];
    String js = respuesta.body;
    print(statusCode.toString()+"\n"+ headers.toString()+"\n"+ js.toString());
    print(respuesta.toString());
    print("Devuelvo la Respuesta: "+js);
    return(js);
  }
/*  click(){
    print('click');
    //clave.currentState.repintar('Nuevo Texto');
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Estufa Pellet"),
      ),
      drawer: Drawer(
          child: ListView(
            children: <Widget>[
              //1 -------------------------
              DrawerHeader(
                decoration: BoxDecoration(
                    color: Colors.yellowAccent
                ),
                child: Text(
                    "HEADER"
                ),
              ),
              // 3 -----------------------
              FlatButton(
                onPressed: (){
                  setState(() {
                    mostrar = "Uno";
                  });
                },
                child: Text("Ventana 1"),
              ),
              // 3 -----------------------
              FlatButton(
                onPressed: (){
                  setState(() {
                    mostrar = "Dos";
                  });
                },
                child: Text("Ventana 2"),
              )

            ],
          )
      ),
      body: Center(
        //child: Inicio(),
          child:ListView(
              children: [
                if(mostrar=="Inicio") Inicio(key: kInicio, Json: objJson)
                else if (mostrar=="Uno") Text("Ventana 1")
                else if (mostrar=="Dos") Text("Ventana 2")
              ]
          )
      ),
    );
  }
}


