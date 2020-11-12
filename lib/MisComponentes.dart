import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';// https://pub.dev/packages/syncfusion_flutter_gauges/install // https://pub.dev/packages/syncfusion_flutter_gauges

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
              Text("La temperatura es: "+temperatura),
              SfRadialGauge(
                      axes: <RadialAxis>[
                        RadialAxis(minimum: 0, maximum: 40,
                            ranges: <GaugeRange>[
                              GaugeRange(startValue: 0, endValue: 5, color:Colors.lightBlueAccent),
                              GaugeRange(startValue: 5, endValue: 10, color:Colors.blue),
                              GaugeRange(startValue: 10,endValue: 15,color: Colors.lightGreenAccent),
                              GaugeRange(startValue: 15,endValue: 20,color: Colors.greenAccent),
                              GaugeRange(startValue: 20,endValue: 25,color: Colors.green),
                              GaugeRange(startValue: 25,endValue: 30,color: Colors.yellowAccent),
                              GaugeRange(startValue: 30,endValue: 35,color: Colors.orangeAccent),
                              GaugeRange(startValue: 35,endValue: 40,color: Colors.red),
                            ],
                            pointers: <GaugePointer>[
                              NeedlePointer(value: 90)],
                            annotations: <GaugeAnnotation>[
                              GaugeAnnotation(widget: Container(child:
                              Text('90.0',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold))),
                                  angle: 90, positionFactor: 0.5
                              )]
                        )])
            ],
          ),
    );


  }
}

//-----------------------------------------------------------------------------------------------------------------------INICIO