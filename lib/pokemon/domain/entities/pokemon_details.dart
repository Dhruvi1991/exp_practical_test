import 'package:equatable/equatable.dart';

import 'pokemon_stat_attributes.dart';

class PokemonDetails extends Equatable {
  final String? imageUrl;
  final List<PokemonStatAttributes>? attributesList;

  const PokemonDetails({required this.imageUrl, required this.attributesList});

  @override
  List<Object?> get props => [imageUrl];
}
