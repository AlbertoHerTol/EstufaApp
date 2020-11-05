import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // tools-flutter- flutter pub get
import 'dart:convert';
/*-------------------------------------------------  PLANTILLA STATEFUL
class Formulario extends StatefulWidget{
  @override
  FormularioState createState(){
    print("CreateState de Formulario");
    return new FormularioState();
  }
}
class FormularioState extends State<Formulario>{
  @override
  Widget build (BuildContext context){
    return Text(" Hola");
  }
}
 */

//-----------------------------------------------------------------------------------------------------------------------INICIO
class Inicio extends StatefulWidget{
  @override
  InicioState createState(){
    print("CreateState de Inicio");
    return new InicioState();
  }
}
class InicioState extends State<Inicio>{
  String _server = 'http://192.168.56.1:8008/hello/';
  var objJson;
  String ms;

  InicioState(){
    print('Constructor InicioState');
    consultar().then((x){

      print('Entrando en then()');
      setState((){
        ms=x;
      });
      print('Entro en decode');
      objJson=jsonDecode(ms);
      print("La TEMPERATURA AMBIENTE ES: "+objJson["estufa"]["estado"]["TemperaturaAmbiente"].toString());
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



  @override
  Widget build (BuildContext context){

    return Container(
        padding: const EdgeInsets.all(8),
        child:
          //Text('Temperatura Ambiente:'+objJson["estufa"]["estado"]["TemperaturaAmbiente"].toString()),
          Text("VENTANA DE INICIO "),
    );


  }
}

//-----------------------------------------------------------------------------------------------------------------------TEMPERATURA