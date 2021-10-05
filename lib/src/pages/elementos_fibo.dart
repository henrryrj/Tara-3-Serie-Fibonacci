// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ElementosFibo extends StatelessWidget {
  final List<int> L;
  const ElementosFibo(this.L, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Elementos Fibonacci')),
        body: Center(
          child: ListView.builder(
              itemCount: L.length,
              itemBuilder: (context, i) {
                return Column(children: [
                  Text(
                    'elemento ${i+1}: ${L[i].toString()}',
                    style: TextStyle(fontFamily: 'Courier New', fontSize: 20),
                  ),
                  Divider()
                ]);
              }),
        ));
  }
}
