import 'package:equatable/equatable.dart';
import 'package:exp_practical_test/pokemon/domain/entities/pokemon.dart';
import 'package:exp_practical_test/pokemon/domain/usecases/get_pokemons.dart';

import '../../../../shared/network/failures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final GetPokemons getPokemonUsecase;

  PokemonBloc({required this.getPokemonUsecase}) : super(PokemonInitial()) {
    on<GetPokemonEvent>(_onGetPokemonRequested);
  }

  _onGetPokemonRequested(
      GetPokemonEvent event, Emitter<PokemonState> emit) async {
    emit(PokemonLoading());

    final result = await getPokemonUsecase.execute(
        limit: event.limit, offset: event.offset);
    emit(result.fold(
        (l) => PokemonLoadedWithError(message: _getErrorMessage(l)),
        (r) => PokemonLoadedWithSuccess(pokemons: r)));
  }

  String _getErrorMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return (failure as ServerFailure).message;
      default:
        return 'An unknown error has occured';
    }
  }
}
