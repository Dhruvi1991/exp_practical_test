part of 'pokemon_bloc.dart';

abstract class PokemonEvent extends Equatable {}

class GetPokemonEvent extends PokemonEvent {
  final int limit;
  final int offset;

  GetPokemonEvent({required this.limit, required this.offset});

  @override
  List<Object?> get props => [];
}
