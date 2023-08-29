part of 'pokemon_bloc.dart';

abstract class PokemonState extends Equatable {}

class PokemonInitial extends PokemonState {
  @override
  List<Object?> get props => [];
}

class PokemonLoading extends PokemonState {
  @override
  List<Object?> get props => [];
}

class PokemonLoadedWithSuccess extends PokemonState {
  final List<Pokemon> pokemons;

  PokemonLoadedWithSuccess({required this.pokemons});

  @override
  List<Object?> get props => [pokemons];
}

class PokemonLoadedWithError extends PokemonState {
  final String message;

  PokemonLoadedWithError({required this.message});

  @override
  List<Object?> get props => [message];
}
