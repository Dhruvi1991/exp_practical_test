import 'package:exp_practical_test/pokemon/presentation/widgets/pokemon_stat_attributes_item.dart';
import 'package:flutter/material.dart';

import '../blocs/pokemon_details/pokemon_details_bloc.dart';

class PokemonDetailWidget extends StatelessWidget {
  final PokemonDetailsLoadedWithSuccess state;

  const PokemonDetailWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(8),
          child: SizedBox(
            height: 200,
            width: 200,
            child: state.pokemonDetails.imageUrl != null &&
                    state.pokemonDetails.imageUrl!.isNotEmpty
                ? Image.network(state.pokemonDetails.imageUrl!)
                : Image.asset('assets/images/no_image.jpeg'),
          ),
        ),
        Expanded(
            child: Card(
          elevation: 4,
          child: ListView.builder(
              itemCount: state.pokemonDetails.attributesList != null
                  ? state.pokemonDetails.attributesList!.length
                  : 0,
              itemBuilder: (BuildContext context, int index) {
                return PokemonStatAttributesItem(
                  pokemonStatAttributes:
                      state.pokemonDetails.attributesList![index],
                );
              }),
        ))
      ],
    );
  }
}
