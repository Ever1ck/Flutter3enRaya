import 'package:app_upeu/apis/resultado_api.dart';
import 'package:app_upeu/modelo/ResultadoModelo.dart';
import 'package:app_upeu/theme/AppTheme.dart';
import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:provider/provider.dart';

class ResultadoFormEdit extends StatefulWidget {
  ResultadoModelo modelP;

  ResultadoFormEdit({this.modelP}) : super();

  @override
  _ResultadoFormEditState createState() =>
      _ResultadoFormEditState(modelP: modelP);
}

List<Map<String, String>> lista = [
  {'value': 'M', 'display': 'Masculino'},
  {'value': 'F', 'display': 'Femenino'}
];

class _ResultadoFormEditState extends State<ResultadoFormEdit> {
  String _nombre_partida;
  String _nombre_jugador1;
  String _nombre_jugador2;
  String _ganador;
  String _punto;
  String _estado;

  ResultadoModelo modelP;
  _ResultadoFormEditState({this.modelP}) : super();

  final _formKey = GlobalKey<FormState>();
  GroupController controller = GroupController();
  GroupController multipleCheckController = GroupController(
    isMultipleSelection: true,
  );

  Widget _buildPartida() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Nombre:'),
      initialValue: modelP.nombre_partida,
      keyboardType: TextInputType.text,
      validator: (String value) {
        if (value.isEmpty) {
          return 'DNI Requerido!';
        }
        return null;
      },
      onSaved: (String value) {
        _nombre_partida = value;
      },
    );
  }

  Widget _buildJugador1() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Nombre:'),
      keyboardType: TextInputType.text,
      initialValue: modelP.nombre_jugador1,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Nombre Requerido!';
        }
        return null;
      },
      onSaved: (String value) {
        _nombre_jugador1 = value;
      },
    );
  }

  Widget _buildJugador2() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Apellido Pat:'),
      keyboardType: TextInputType.text,
      initialValue: modelP.nombre_jugador2,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Apellido Paterno Requerido!';
        }
        return null;
      },
      onSaved: (String value) {
        _nombre_jugador2 = value;
      },
    );
  }

  Widget _buildGanador() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Apellido Mat:'),
      keyboardType: TextInputType.text,
      initialValue: modelP.ganador,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Apellido Materno Requerido!';
        }
        return null;
      },
      onSaved: (String value) {
        _ganador = value;
      },
    );
  }

  Widget _buildPunto() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Num. Telefono:'),
      keyboardType: TextInputType.phone,
      initialValue: modelP.punto,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Numero de Telefono Requerido';
        }
        return null;
      },
      onSaved: (String value) {
        _punto = value;
      },
    );
  }

  Widget _buildEstado() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Correo:'),
      keyboardType: TextInputType.emailAddress,
      initialValue: modelP.estado,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Correo es campo Requerido';
        }
        return null;
      },
      onSaved: (String value) {
        _estado = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Form. Reg. Persona"),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Container(
              margin: EdgeInsets.all(24),
              color: AppTheme.nearlyWhite,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    /*_buildName(),*/
                    _buildPartida(),
                    _buildJugador1(),
                    _buildJugador2(),
                    _buildGanador(),
                    _buildPunto(),
                    _buildEstado(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context, true);
                              },
                              child: Text('Cancelar')),
                          ElevatedButton(
                            onPressed: () async {
                              // Validate returns true if the form is valid, or false otherwise.
                              if (_formKey.currentState.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Processing Data'),
                                  ),
                                );
                                _formKey.currentState.save();
                                ResultadoModelo mp = new ResultadoModelo();
                                mp.nombre_partida = _nombre_partida;
                                mp.nombre_jugador1 = _nombre_jugador1;
                                mp.nombre_jugador2 = _nombre_jugador1;
                                mp.ganador = _ganador;
                                mp.punto = _punto;
                                mp.estado = _estado;

                                print("IDX: $modelP.id");
                                var api = await Provider.of<ResultadoApi>(
                                        context,
                                        listen: false)
                                    .updateResultado(modelP.id.toInt(), mp);
                                print("ver: ${api.toJson()['success']}");
                                if (api.toJson()['success'] == true) {
                                  Navigator.pop(context, () {
                                    setState(() {});
                                  });
                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => NavigationHomeScreen()));
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'No estan bien los datos de los campos!'),
                                  ),
                                );
                              }
                            },
                            child: const Text('Guardar'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }
}
