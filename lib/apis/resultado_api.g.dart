part of 'resultado_api.dart';

class _ResultadoApi implements ResultadoApi {
  _ResultadoApi(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= UrlApi.urlApix;
  }
  final Dio _dio;
  String baseUrl;

  @override
  createResultado(resultadom) async {
    ArgumentError.checkNotNull(resultadom, 'resultados');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(resultadom.toJson() ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/api/resultado',
        queryParameters: queryParameters,
        options:
            RequestOptions(method: 'POST', extra: _extra, baseUrl: baseUrl),
        data: _data);
    final value = ResponseModelo.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  deleteResultado(id) async {
    ArgumentError.checkNotNull(id, '0');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/api/resultado/$id',
        queryParameters: queryParameters,
        options:
            RequestOptions(method: 'DELETE', extra: _extra, baseUrl: baseUrl),
        data: _data);
    final value = ResponseModelo.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  getResultado() async {
    final prefs = await SharedPreferences.getInstance();
//var tokenx = prefs.getString("token");
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/api/resultado/',
        queryParameters: queryParameters,
        options: RequestOptions(method: 'GET', extra: _extra, baseUrl: baseUrl),
        data: _data);
/*var value = _result.data.map((dynamic i) =>
PersonaModelo.fromJson(i as Map<String, dynamic>))
.toList();*/
    var value = ResponseModelo.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  updateResultado(id, resultadom) async {
    ArgumentError.checkNotNull(id, '0');
    ArgumentError.checkNotNull(resultadom, 'resultados');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(resultadom.toJson() ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/api/resultado/$id',
        queryParameters: queryParameters,
        options:
            RequestOptions(method: 'PATCH', extra: _extra, baseUrl: baseUrl),
        data: _data);
    final value = ResponseModelo.fromJson(_result.data);
    return Future.value(value);
  }
}
