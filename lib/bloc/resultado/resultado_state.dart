part of 'resultado_bloc.dart';

class ResultadoState {}

class ResultadoInitialState extends ResultadoState {}

class ResultadoLoadingState extends ResultadoState {}

class ResultadoLoadedState extends ResultadoState {
  List<ResultadoModelo> resultadoList;
  ResultadoLoadedState(this.resultadoList);
}

class ResultadoError extends ResultadoState {
  Error e;
  ResultadoError(this.e);
}
