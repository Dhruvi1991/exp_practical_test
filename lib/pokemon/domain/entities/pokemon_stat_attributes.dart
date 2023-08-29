import 'package:equatable/equatable.dart';

class PokemonStatAttributes extends Equatable {
  final String? name;
  final int? baseStat;

  const PokemonStatAttributes({required this.name, required this.baseStat});

  @override
  List<Object?> get props => [name, baseStat];
}