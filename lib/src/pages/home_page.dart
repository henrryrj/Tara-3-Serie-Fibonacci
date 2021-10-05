import 'package:flutter/material.dart';
import 'package:hola_mundo/src/pages/elementos_fibo.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _n = 0;
  List<int> elementos = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TAREA #3'), centerTitle: true, elevation: 1),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('SERIE DE FIBONACCI',
              style: TextStyle(
              fontFamily: 'Courier New',
              fontSize: 20,
              fontStyle: FontStyle.italic,)),
            Divider(),
            _crearInput(),
            Divider(),
            ElevatedButton(
              style: ButtonStyle( backgroundColor: MaterialStateProperty.all(Colors.blue[300])),
              child: Text('Calcular',style: TextStyle(color: Colors.white)),
              onPressed: () => setState(() {
                elementos = _fibonacci(_n);
                final route = MaterialPageRoute(builder: (context) => ElementosFibo(elementos));
                Navigator.push(context, route);}))
                    ]
        )
      ),
    );
  }

  // ignore: unused_element
  Widget _crearInput() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border:OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Ingrese la cantidad',
        labelText: 'Cantidad de elementos:'),
      onChanged: (valor) => setState(() {
        if (valor.isNotEmpty) {
          _n = int.parse(valor);
        }
      }));
  }

  List<int> _fibonacci(int cantidad) {
    List<int> elementosFibo = [];
    int a, b, c;
    a = 0;
    b = 1;
    c = 0;
    for (int i = 1; i <= cantidad; i++) {
      elementosFibo.add(a);
      c = a + b;
      a = b;
      b = c;
    }
    return elementosFibo;
  }
}
