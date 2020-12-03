import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clarika_test/provider/UsuarioProvider.dart';

import 'package:clarika_test/paginas/ListadoUsuarios.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => UsuarioProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test Clarika',
      home: ListadoUsuarios(),
      theme: ThemeData(
        primaryColor: Color(0xFF682A8A),
        accentColor: Color(0x77682A8A)
      )
    );
  }
}


