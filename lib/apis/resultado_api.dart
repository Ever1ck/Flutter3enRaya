import 'package:app_upeu/modelo/ResultadoModelo.dart';
import 'package:app_upeu/util/UrlApi.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
part 'resultado_api.g.dart';

@RestApi(baseUrl: UrlApi.urlApix)
abstract class ResultadoApi {
  factory ResultadoApi(Dio dio, {String baseUrl}) = _ResultadoApi;
  static ResultadoApi create() {
    var dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    return ResultadoApi(dio);
  }

  @GET("/api/resultado")
  Future<ResponseModelo> getResultado();
  @POST("/api/resultado")
  Future<ResponseModelo> createResultado(@Body() ResultadoModelo resultadoM);
  @DELETE("/api/resultado/{id}")
  Future<ResponseModelo> deleteResultado(@Path("id") int id);
  @PATCH("/api/resultado/{id}")
  Future<ResponseModelo> updateResultado(
      @Path("id") int id, @Body() ResultadoModelo resultadoM);
}
