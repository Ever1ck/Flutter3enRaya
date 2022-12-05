import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ResultadoModelo {
  int id = 0;
  String nombre_partida,
      nombre_jugador1,
      nombre_jugador2,
      ganador,
      punto,
      estado;
  ResultadoModelo(
      {this.id,
      this.nombre_partida,
      this.nombre_jugador1,
      this.nombre_jugador2,
      this.ganador,
      this.punto,
      this.estado});
  factory ResultadoModelo.fromJson(Map<String, dynamic> map) {
    return ResultadoModelo(
      id: map['id'] as int,
      nombre_partida: map['nombre_partida'],
      nombre_jugador1: map['nombre_jugador1'],
      nombre_jugador2: map['nombre_jugador2'],
      ganador: map['ganador'],
      punto: map['punto'],
      estado: map['estado'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre_partida': nombre_partida,
      'nombre_jugador1': nombre_jugador1,
      'nombre_jugador2': nombre_jugador2,
      'ganador': ganador,
      'punto': punto,
      'correo': estado,
    };
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["id"] = id;
    map["nombre_partida"] = nombre_partida;
    map["nombre_jugador1"] = nombre_jugador1;
    map["nombre_jugador2"] = nombre_jugador2;
    map["ganador"] = ganador;
    map["punto"] = punto;
    map["estado"] = estado;
    /*if (id != null) {
      map["id"] = id;
    }*/
    return map;
  }

  ResultadoModelo.fromObject(dynamic o) {
    this.id = o["id"];
    this.nombre_partida = o["nombre_partida"];
    this.nombre_jugador1 = o["nombre_jugador1"];
    this.nombre_jugador2 = o["nombre_jugador2"];
    this.ganador = o["ganador"];
    this.punto = o["punto"];
    this.estado = o["estado"];
    //this.edad = int.tryParse(o["edad"].toString());
  }

  @override
  String toString() {
    return 'ResultadoModelo{id: $id, nombre_partida: $nombre_partida, nombre_jugador1: $nombre_jugador1, nombre_jugador2: $nombre_jugador2, ganador: $ganador, punto: $punto, estado: $estado}';
  }
}

@JsonSerializable()
class ResponseModelo {
  bool success;
  List<ResultadoModelo> data;
  String message;
  ResponseModelo({this.success, this.data, this.message});
  factory ResponseModelo.fromJson(Map<String, dynamic> map) {
    return ResponseModelo(
      success: map['success'] as bool,
      data: (map['data'] as List)
          ?.map((e) => e == null
              ? null
              : ResultadoModelo.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      message: map['message'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data,
      'message': message,
    };
  }
}

@JsonSerializable()
class MsgModelo {
  String mensaje;

  MsgModelo({this.mensaje});
  factory MsgModelo.fromJson(Map<String, dynamic> map) {
    return MsgModelo(
      mensaje: map['mensaje'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'mensaje': mensaje,
    };
  }
}
