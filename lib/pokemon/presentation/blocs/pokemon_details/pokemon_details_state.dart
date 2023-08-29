part of 'pokemon_details_bloc.dart';

abstract class PokemonDetailsState extends Equatable {}

class PokemonDetailsInitial extends PokemonDetailsState {
  @override
  List<Object?> get props => [];
}

class PokemonDetailsLoading extends PokemonDetailsState {
  @override
  List<Object?> get props => [];
}

class PokemonDetailsLoadedWithSuccess extends PokemonDetailsState {
  final PokemonDetails pokemonDetails;

  PokemonDetailsLoadedWithSuccess({required this.pokemonDetails});

  @override
  List<Object?> get props => [pokemonDetails];
}

class PokemonDetailsLoadedWithError extends PokemonDetailsState {
  final String message;

  PokemonDetailsLoadedWithError({required this.message});

  @override
  List<Object?> get props => [message];
}