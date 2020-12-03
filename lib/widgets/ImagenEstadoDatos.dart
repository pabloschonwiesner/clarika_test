import 'package:clarika_test/provider/UsuarioProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ImagenEstadoDatos extends StatelessWidget {
  final String mensaje;
  final String urlImagen;
  final double ancho;

  ImagenEstadoDatos({this.mensaje, this.urlImagen, this.ancho });

  @override
  Widget build(BuildContext context) {
    UsuarioProvider usuarioProvider = Provider.of<UsuarioProvider>(context);
    
    return Column(
      children: [
        SizedBox(height: 65,),
        Text(mensaje, style: TextStyle(fontSize: 14, color: Colors.grey[600]),),
        SizedBox(height: 30,),
        RaisedButton(
          child: Text('Refrescar', style: TextStyle(color: Colors.white),),
          color: Theme.of(context).primaryColor,
          onPressed: () => usuarioProvider.iniciar(),
        ),
        SizedBox(height: 35),
        Container(
          // padding: EdgeInsets.only(top: ),
          child: SvgPicture.asset(urlImagen, width: ancho, alignment: Alignment.center,)
        ),
        
      ],
    );
  }
}