import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:clarika_test/models/UsuarioModel.dart';

class DetalleUsuario extends StatelessWidget {
  final UsuarioModel usuario;
  DetalleUsuario({this.usuario});  

  Widget _fotoUsuario(double ancho) {       
    return ClipRRect(
      borderRadius: BorderRadius.circular(ancho / 2 + 3) ,
      child: Container(
        width: ancho + 6,
        height: ancho + 6,
        padding: EdgeInsets.all(3.0),
        color: Colors.white,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(ancho / 2) ,
          child: Container(
            width: ancho,
            height: ancho,
            color: Colors.grey[300],
            child: FadeInImage(
              placeholder: AssetImage('assets/avatarPlaceholder.jpg'),
              image: NetworkImage(usuario.photo)
            )        
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    double proporcion = size.height > size.width ? 0.45 : 0.55;
    double ancho = size.height > size.width ? size.width * proporcion : size.height * proporcion; 

    return Scaffold(
      appBar: AppBar(elevation: 0,),
      body: Container(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(         
          children: [
            Container(
              height: 100 + ancho /2,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(width: double.infinity, height: 100, color: Theme.of(context).primaryColor,),
                  Positioned(
                    top: 15,
                    left: size.width / 2 - ancho /2, 
                    child: Container(
                      child: _fotoUsuario(ancho),
                    )              
                  ),         
                ],
              ),
            ),
            SizedBox(height: 60 * proporcion,),              
            Stack(
              overflow: Overflow.visible,
              children: [
                Column(
                  children: [
                    Text('${usuario.firstName} ${usuario.lastName}', overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 28, color: Colors.black),),
                    Text(usuario.jobPosition, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                  ],
                ),
                Positioned(
                  top: 7,
                  left: -30,
                  child: SvgPicture.asset(
                    'assets/${usuario.gender == 'M' ? 'male' : 'female'}.svg',
                    width: 14,
                    color: usuario.gender == 'M' ? Color(0xFF48B0FF) : Color(0x99682A8A),
                  ),
                )
              ],
            ),     
            SizedBox(height: 30,),  
            Stack(
              overflow: Overflow.visible,
              children: [
                Text('${usuario.location}', overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 14, color: Colors.grey[600],)),
                Positioned(
                  top: -3,
                  left: -30,
                  child: Icon(Icons.place),
                )
              ],
            ),       
            
            
            SizedBox(height: 100),
          ],
        ))
      )
    );
  }
}