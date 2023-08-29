part of 'pokemon_details_bloc.dart';

abstract class PokemonDetailsEvent extends Equatable {}

class GetPokemonDetailsEvent extends PokemonDetailsEvent {
  final String pokemonName;

  GetPokemonDetailsEvent({required this.pokemonName});

  @override
  List<Object?> get props => [];
}
