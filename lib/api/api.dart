import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;

import 'package:clarika_test/models/UsuarioModel.dart';

class Api {
  String baseUrl = 'https://my-json-server.typicode.com/juanagu/mobile-interview/'; 

  Future<List<UsuarioModel>> pedirUsuarios() async {
    try {
      final response = await http.get('$baseUrl/users');
      if(response.statusCode == 200) {
        final parsed = json.decode(response.body);
        
        return (parsed as List)
          .map((usuario) => UsuarioModel.fromJson(usuario))
          .toList();
      } else {
        throw PlatformException(code: '500', message: 'Hubo un error en el servidor!');
      }
    } on PlatformException catch(e) {
      print(e);
      return [];
    }
  }
}