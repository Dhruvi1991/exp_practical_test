import 'package:equatable/equatable.dart';
import 'package:exp_practical_test/pokemon/domain/entities/pokemon_details.dart';
import 'package:exp_practical_test/pokemon/domain/usecases/get_pokemon_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/network/failures.dart';

part 'pokemon_details_event.dart';

part 'pokemon_details_state.dart';

class PokemonDetailsBloc
    extends Bloc<PokemonDetailsEvent, PokemonDetailsState> {
  final GetPokemonDetails getPokemonDetailsUsecase;

  PokemonDetailsBloc({required this.getPokemonDetailsUsecase})
      : super(PokemonDetailsInitial()) {
    on<GetPokemonDetailsEvent>(_onGetPokemonDetailsRequested);
  }

  _onGetPokemonDetailsRequested(
      GetPokemonDetailsEvent event, Emitter<PokemonDetailsState> emit) async {
    emit(PokemonDetailsLoading());

    final result =
        await getPokemonDetailsUsecase.execute(name: event.pokemonName);
    emit(result.fold(
        (l) => PokemonDetailsLoadedWithError(message: _getErrorMessage(l)),
        (r) => PokemonDetailsLoadedWithSuccess(pokemonDetails: r)));
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
