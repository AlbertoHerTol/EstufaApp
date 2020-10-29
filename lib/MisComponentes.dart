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


class Inicio extends StatefulWidget{
  @override
  InicioState createState(){
    print("CreateState de Inicio");
    return new InicioState();
  }
}
class InicioState extends State<Inicio>{
  String _server = 'http://google.com';
  var objJson;

  InicioState(){
    print('Constructor InicioState');
    consultar().then((x){
      print('Entrando en then() Respuesta = '+x);
      setState((){
        objJson=json.decode(x);
      });
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

    return ListView(
        padding: const EdgeInsets.all(8),
        children:[
          //Text('Temperatura Ambiente:'+objJson["estufa"]["estado"]["TemperaturaAmbiente"].toString()),
          Text('hola'),
        ]
    );


  }
}