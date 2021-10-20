import 'dart:convert';
import 'package:http/http.dart' as http;
class FiboProvider {
  String _url = 'api-nodejs-seriefibonacci.herokuapp.com';

  Future<List<int>> getElementos(int n) async {
    List<int> L1 = [];
    final url = Uri.https(_url, '/fibonacci');
    try {
      final respuesta = await http.post(url, body: {'n': '$n'});
      List elementos = json.decode(respuesta.body);
      L1 =  elementos.map<int>((e) => e).toList(); //que buena lineaaaa
    } catch (e) {
      print(e);
    }
    return L1;
  }
}
