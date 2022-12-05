import 'dart:async';
import 'package:app_upeu/modelo/ResultadoModelo.dart';
import 'package:app_upeu/repository/ResultadoRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'resultado_event.dart';
part 'resultado_state.dart';

class ResultadoBloc extends Bloc<ResultadoEvent, ResultadoState> {
  final ResultadoRepository _resultadoRepository;
  ResultadoBloc({ResultadoRepository resultadoRepository})
      : _resultadoRepository = resultadoRepository,
        super(ResultadoInitialState());
  @override
  Stream<ResultadoState> mapEventToState(ResultadoEvent event) async* {
    if (event is ListarResultadoEvent) {
      yield ResultadoLoadingState();
      try {
        List<ResultadoModelo> resultadoList =
            await _resultadoRepository.getResultado();
        yield ResultadoLoadedState(resultadoList);
      } catch (e) {
        print("Error ${e.toString()}");
        yield ResultadoError(e);
      }
    } else if (event is DeleteResultadoEvent) {
      try {
        await _resultadoRepository.deleteResultado(event.resultadom.id);
        yield ResultadoLoadingState();
        List<ResultadoModelo> resultadoList =
            await _resultadoRepository.getResultado();
        yield ResultadoLoadedState(resultadoList);
      } catch (e) {
        print("Error ${e.toString()}");
        yield ResultadoError(e);
      }
    } else if (event is CreateResultadoEvent) {
      try {
        await _resultadoRepository.createResultado(event.resultadom);
        yield ResultadoLoadingState();
        List<ResultadoModelo> resultadoList =
            await _resultadoRepository.getResultado();
        yield ResultadoLoadedState(resultadoList);
      } catch (e) {
        print("Error ${e.toString()}");
        yield ResultadoError(e);
      }
    } else if (event is UpdateResultadoEvent) {
      try {
        await _resultadoRepository.updateResultado(
            event.resultadom.id, event.resultadom);
        yield ResultadoLoadingState();
        List<ResultadoModelo> resultadoList =
            await _resultadoRepository.getResultado();
        yield ResultadoLoadedState(resultadoList);
      } catch (e) {
        print("Error ${e.toString()}");
        yield ResultadoError(e);
      }
    }
  }
}
