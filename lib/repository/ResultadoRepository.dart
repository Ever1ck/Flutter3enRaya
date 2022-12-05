import 'dart:async';
import 'package:app_upeu/apis/resultado_api.dart';
import 'package:app_upeu/local/dao/ResultadoDao.dart';
import 'package:app_upeu/modelo/ResultadoModelo.dart';
import 'package:app_upeu/util/NetworConnection.dart';
import 'package:dio/dio.dart';

class ResultadoRepository {
  ResultadoApi resultadoApi;
  ResultadoLocate resultadoLocal;
  bool result;

  ResultadoRepository() {
    Dio _dio = Dio();
    _dio.options.headers["Content-Type"] = "application/json";
    resultadoApi = ResultadoApi(_dio);
    resultadoLocal = ResultadoLocate();
  }

  Future<List<ResultadoModelo>> getResultado() async {
    if (await isConected()) {
      return await resultadoApi.getResultado().then((value) => value.data);
    } else {
      return await resultadoLocal.getAllResultado();
    }
  }

  Future<ResponseModelo> deleteResultado(int id) async {
    return await resultadoApi.deleteResultado(id);
  }

  Future<ResponseModelo> updateResultado(
      int id, ResultadoModelo resultado) async {
    return await resultadoApi.updateResultado(id, resultado);
  }

  Future<ResponseModelo> createResultado(ResultadoModelo resultado) async {
    if (await isConected()) {
      return await resultadoApi.createResultado(resultado);
    } else {
      resultadoLocal.insertResultado(resultado);
      return ResponseModelo();
    }
  }
}
