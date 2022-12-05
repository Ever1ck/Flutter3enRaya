import 'package:app_upeu/local/db/db_conecction.dart';
import 'package:app_upeu/modelo/ResultadoModelo.dart';

class ResultadoLocate extends ResultadoRepository {
  Future<List<ResultadoModelo>> getAllResultado() async {
    final db = await database;
    var result = await db.rawQuery('SELECT * FROM resultados');
    List<ResultadoModelo> listProduct = result.isNotEmpty
        ? result.map((c) => ResultadoModelo.fromObject(c)).toList()
        : [];
    return listProduct;
  }

  Future<MsgModelo> insertResultado(ResultadoModelo resultadom) async {
    final db = await database;
    var result = await db.rawInsert(
        'INSERT INTO resultados(nombre_partida, nombre_jugador1, nombre_jugador2, ganador, punto, estado) VALUES(?,?,?,?,?,?)',
        [
          resultadom.nombre_partida,
          resultadom.nombre_jugador1,
          resultadom.nombre_jugador2,
          resultadom.ganador,
          resultadom.punto,
          resultadom.estado
        ]);
    Map<String, dynamic> resultado = {'mensaje': "Se creo correctamente"};
    if (result == 1) {
      return Future.value(MsgModelo.fromJson(resultado));
    }
    resultado["mensaje"] = "No se pudo Registrar";
    return Future.value(MsgModelo.fromJson(resultado));
  }

  //Actualizar Datos
  Future<MsgModelo> updatePersona(ResultadoModelo resultadom) async {
    final db = await database;
    int result = await db.update('resultados', resultadom.toMap(),
        where: 'id = ${resultadom.id}');
    Map<String, dynamic> resultado = {'mensaje': "updated!!"};
    if (result == 1) {
      return Future.value(MsgModelo.fromJson(resultado));
    }
    resultado["mensaje"] = "No se pudo modificar los datos";
    return Future.value(MsgModelo.fromJson(resultado));
  }

  //Eliminar
  Future<MsgModelo> deletePersona(int id) async {
    final db = await database;
    var res = await db.delete('resultados', where: 'id = $id');
    Map<String, dynamic> resultado = {'mensaje': "Deleted!!", 'id': id};
    if (res == 1) {
      return Future.value(MsgModelo.fromJson(resultado));
    }
    resultado["mensaje"] = "Error al eliminar";
    return Future.value(MsgModelo.fromJson(resultado));
  }

  Future<int> deleteAll() async {
    final db = await database;
    return await db.delete('resultados');
  }
}
