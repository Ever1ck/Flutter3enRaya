part of 'resultado_bloc.dart';

abstract class ResultadoEvent {
  final ResultadoModelo resultadom;
  const ResultadoEvent({this.resultadom});
}

class ListarResultadoEvent extends ResultadoEvent {
  ListarResultadoEvent();
}

class DeleteResultadoEvent extends ResultadoEvent {
  DeleteResultadoEvent({@required ResultadoModelo resultadom})
      : super(resultadom: resultadom);
}

class UpdateResultadoEvent extends ResultadoEvent {
  UpdateResultadoEvent({@required ResultadoModelo resultadom})
      : super(resultadom: resultadom);
}

class CreateResultadoEvent extends ResultadoEvent {
  CreateResultadoEvent({@required ResultadoModelo resultadom})
      : super(resultadom: resultadom);
}
