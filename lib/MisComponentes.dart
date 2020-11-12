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
  var json;
  Inicio({Key key,var Json}):super(key:key){
    print('Constructor Inicio clave: '+key.toString());
    this.json=Json;
  }

  @override
  InicioState createState(){
    print("CreateState de Inicio");
    return new InicioState(this.json);
  }
}


class InicioState extends State<Inicio>{
  //String _server = 'http://192.168.56.1:8008/hello/';
  var objJson;
  String ms;
  String temperatura="0";

  void repaint(var js){
    objJson=js;
    print('Repintando Inicio');
    print ("json-->"+objJson.toString());
    print("la temperatura del json es:"+objJson["estufa"]["estado"]["TemperaturaAmbiente"].toString());
    print ("la variable temperatura es");
    temperatura=objJson["estufa"]["estado"]["TemperaturaAmbiente"].toString();
  }

  InicioState(var json){
    print('Constructor InicioState');
    this.objJson = json;

  }




  @override
  Widget build (BuildContext context){
    return Container(
        padding: const EdgeInsets.all(8),
        child:
          Column(
            children: [
              Text("VENTANA DE INICIO"),
              Text("La temperatura es: "+temperatura)
              // https://pub.dev/packages/syncfusion_flutter_gauges/install
              // https://pub.dev/packages/syncfusion_flutter_gauges
            ],
          ),
    );


  }
}

//-----------------------------------------------------------------------------------------------------------------------INICIO