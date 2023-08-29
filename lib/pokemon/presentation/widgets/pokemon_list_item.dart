import 'package:exp_practical_test/pokemon/domain/entities/pokemon.dart';
import 'package:exp_practical_test/shared/resources/colors.dart';
import 'package:flutter/material.dart';

class PokemonListItem extends StatelessWidget {
  final Pokemon pokemon;
  final Function(Pokemon pokemon) onPressed;

  const PokemonListItem(
      {super.key, required this.pokemon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => onPressed(pokemon),
        child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      (pokemon.name == null || pokemon.name!.isEmpty)
                          ? "Pokemon"
                          : pokemon.name!,
                      style: const TextStyle(
                          fontSize: 16, color: primaryColor)),
                  const SizedBox(height: 4),
                  Text(
                    (pokemon.url == null || pokemon.url!.isEmpty)
                        ? "https://pokeapi.co"
                        : pokemon.url!,
                    style: const TextStyle(
                        fontSize: 12, fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            )));
  }
}
