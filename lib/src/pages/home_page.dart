import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hola_mundo/src/pages/elementos_fibo.dart';
import 'package:hola_mundo/providers/fiboProviders.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _n = 0;
  List<int> elementos = [];
  FiboProvider _fibo = FiboProvider();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: Text('TAREA #3'), centerTitle: true, elevation: 1),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('SERIE DE FIBONACCI',
                style: TextStyle(
                  fontFamily: 'Courier New',
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                )),
            Divider(),
            _crearInput(),
            Divider(),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blue[300])),
                child: Text('Calcular', style: TextStyle(color: Colors.white)),
                onPressed: () async {
                  elementos = await _fibo.getElementos(_n);
                  if (elementos.length > 0) {
                    final route = MaterialPageRoute(
                        builder: (context) => ElementosFibo(elementos));
                    Navigator.push(context, route);
                  } else {
                    showDialog(
                        context: context,
                        builder: (context) => CupertinoAlertDialog(
                              title: Text('Error, '),
                              content: Text('Debe ingresar un numero valido'),
                              actions: [
                                CupertinoDialogAction(
                                    child: Text('Aceptar'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    })
                              ],
                            ));
                  }
                })
          ]),
        ));
  }

  /*Widget _getFibo(int n){
    return FutureBuilder(
      future: _fibo.getElementos(n),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }else{
          return snapshot.data;
        }
      }
    );
  }*/

  // ignore: unused_element
  Widget _crearInput() {
    return TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'Ingrese la cantidad',
            labelText: 'Cantidad de elementos:'),
        onChanged: (valor) => setState(() {
              if (valor.isNotEmpty) {
                _n = int.parse(valor);
              }
            }));
  }
}
