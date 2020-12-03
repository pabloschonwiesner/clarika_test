import 'package:clarika_test/provider/UsuarioProvider.dart';
import 'package:clarika_test/widgets/ImagenEstadoDatos.dart';
import 'package:flutter/material.dart';

import 'package:clarika_test/models/UsuarioModel.dart';
import 'package:clarika_test/paginas/DetalleUsuario.dart';
import 'package:provider/provider.dart';


class ListadoUsuarios extends StatefulWidget {
  @override
  _ListadoUsuariosState createState() => _ListadoUsuariosState();
}

class _ListadoUsuariosState extends State<ListadoUsuarios> {  

  Widget _widgetListaUsuarios(List<UsuarioModel> listaUsuarios) {
    List<Widget> _lst = List<Widget>();

    listaUsuarios.forEach((usuario) { 
      _lst.add(Column(
        children: [
          ListTile(
            title: Text('${usuario.firstName} ${usuario.lastName}', style: TextStyle(fontSize: 20)),
            subtitle: Text('${usuario.gender == 'M' ? 'Hombre' : 'Mujer'}', style: TextStyle(fontSize: 12)),
            trailing: Icon(Icons.arrow_forward_ios, size: 14,),
            dense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 0),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DetalleUsuario(usuario: usuario)));
            },
          ),
          Divider(thickness: 0.5,)
          
        ],
      ));
    });
    
    return Column(children: _lst);
  }

  Future<bool> onWillPop(context) {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Está saliendo de la aplicación'),
        content: new Text('¿Está seguro?'),
        actions: <Widget>[
          new IconButton(
            icon: Icon(Icons.check),
            color: Colors.green,
            onPressed: () => Navigator.of(context).pop(true),
          ),
          new IconButton(
            icon: Icon(Icons.clear),
            color: Colors.red,
            onPressed: () => Navigator.of(context).pop(false),            
          ),
        ],
      ),
    ) ?? false;
  }
  

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    double proporcion = size.height > size.width ? 0.6 : 0.75;
    double ancho = size.height > size.width ? size.width * proporcion : size.height * proporcion; 
    UsuarioProvider usuarioProvider = Provider.of<UsuarioProvider>(context);

    return WillPopScope(
      onWillPop: () => onWillPop(context),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Usuarios'),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 16),
            children: <Widget> [
              usuarioProvider.cargando
              ? Container(
                  padding: EdgeInsets.only(top: 60),
                  child: Center(
                  child: CircularProgressIndicator(),
                )
              )
              : usuarioProvider.error
                ? ImagenEstadoDatos(mensaje: 'Hubo un error en el servidor!', urlImagen: 'assets/error.svg', ancho: ancho * 0.8,)
                : usuarioProvider.listaUsuarios.length == 0
                  ? ImagenEstadoDatos(mensaje: 'No hay resultados', urlImagen: 'assets/empty.svg', ancho: ancho)
                  : _widgetListaUsuarios(usuarioProvider.listaUsuarios),
            ]
          ),
        )
      ),
    );
  }
}