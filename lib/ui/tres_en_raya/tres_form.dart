import 'package:app_upeu/apis/resultado_api.dart';
import 'package:app_upeu/bloc/resultado/resultado_bloc.dart';
import 'package:app_upeu/modelo/ResultadoModelo.dart';
import 'package:app_upeu/theme/AppTheme.dart';
import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class ResultadoForm extends StatefulWidget {
  @override
  _ResultadoFormState createState() => _ResultadoFormState();
}

class _ResultadoFormState extends State<ResultadoForm> {
  String _nombre_partida;
  String _nombre_jugador1;
  String _nombre_jugador2;
  String _ganador;
  String _punto;
  String _estado;

  final _formKey = GlobalKey<FormState>();
  GroupController controller = GroupController();
  GroupController multipleCheckController = GroupController(
    isMultipleSelection: true,
  );

  Widget _buildPartida() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Partida:'),
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
      decoration: InputDecoration(labelText: 'Jugador 1:'),
      keyboardType: TextInputType.text,
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
      decoration: InputDecoration(labelText: 'Jugador 2:'),
      keyboardType: TextInputType.text,
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
      decoration: InputDecoration(labelText: 'Ganador:'),
      keyboardType: TextInputType.text,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Ganador Requerido!';
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
      decoration: InputDecoration(labelText: 'Punto:'),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Punto Requerido';
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
      decoration: InputDecoration(labelText: 'Estado:'),
      keyboardType: TextInputType.emailAddress,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Estado Requerido';
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
                                mp.nombre_jugador2 = _nombre_jugador2;
                                mp.ganador = _ganador;
                                mp.punto = _punto;
                                mp.estado = _estado;
                                BlocProvider.of<ResultadoBloc>(context)
                                    .add(CreateResultadoEvent(resultadom: mp));
                                Navigator.pop(context, () {
                                  setState(() {});
                                });
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
