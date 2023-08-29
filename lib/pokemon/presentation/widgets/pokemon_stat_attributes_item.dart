import 'package:exp_practical_test/pokemon/domain/entities/pokemon_stat_attributes.dart';
import 'package:exp_practical_test/shared/resources/colors.dart';
import 'package:flutter/material.dart';

class PokemonStatAttributesItem extends StatelessWidget {
  final PokemonStatAttributes pokemonStatAttributes;

  const PokemonStatAttributesItem(
      {super.key, required this.pokemonStatAttributes});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(children: [
        Text(
          pokemonStatAttributes.name != null &&
                  pokemonStatAttributes.name!.isNotEmpty
              ? pokemonStatAttributes.name!
              : "Pokemon Stats",
          style: const TextStyle(fontSize: 16, color: primaryColor),
        ),
        Text(
          " : ${pokemonStatAttributes.baseStat != null ? pokemonStatAttributes.baseStat!.toString() : "Pokemon Stat value"}",
          style: const TextStyle(fontSize: 16),
        )
      ]),
    );
  }
}
