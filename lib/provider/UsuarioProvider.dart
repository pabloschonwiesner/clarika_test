import 'package:clarika_test/api/api.dart';
import 'package:clarika_test/models/UsuarioModel.dart';
import 'package:flutter/cupertino.dart';

class UsuarioProvider extends ChangeNotifier {
  bool _cargando = true;
  bool _error = true;
  List<UsuarioModel> _listaUsuarios;
  Api _api = Api();
  
  bool get cargando => _cargando;
  bool get error => _error;
  List<UsuarioModel> get listaUsuarios => _listaUsuarios;

  UsuarioProvider() {
    iniciar();
  }

  iniciar() async  {
    try {
      setCargando(true);
      setError(false);
      List<UsuarioModel> listaUsuarios = await _api.pedirUsuarios();
      setCargando(false);
      setListaUsuarios(listaUsuarios);
    } catch (e) {
      setCargando(false);
      setError(true);
      setListaUsuarios([]);
    }
  }

  setCargando(bool cargando) {
    _cargando = cargando;
    notifyListeners();
  }

  setError(bool error) {
    _error = error;
    notifyListeners();
  }

  setListaUsuarios(List<UsuarioModel> listaUsuarios) {
    _listaUsuarios = listaUsuarios;
    notifyListeners();
  }

}