import 'package:exp_practical_test/pokemon/domain/entities/pokemon.dart';
import 'package:exp_practical_test/pokemon/presentation/blocs/pokemon_list/pokemon_bloc.dart';
import 'package:exp_practical_test/pokemon/presentation/pages/pokemon_details.dart';
import 'package:exp_practical_test/pokemon/presentation/widgets/custom_progress_indicator.dart';
import 'package:exp_practical_test/pokemon/presentation/widgets/error_message_view.dart';
import 'package:exp_practical_test/pokemon/presentation/widgets/pokemon_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({Key? key}) : super(key: key);

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<PokemonBloc>(context)
        .add(GetPokemonEvent(limit: 150, offset: 0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PokemonBloc, PokemonState>(builder: (context, state) {
        if (state is PokemonLoading) {
          return const CustomProgressIndicator();
        } else if (state is PokemonLoadedWithSuccess) {
          return ListView.builder(
              itemCount: state.pokemons.length,
              itemBuilder: (BuildContext context, int index) {
                return PokemonListItem(
                  pokemon: state.pokemons[index],
                  onPressed: (pokemon) =>
                      onPokemonSelected(pokemon: pokemon, context: context),
                );
              });
        } else if (state is PokemonLoadedWithError) {
          return ErrorMessageView(message: state.message);
        }
        return const CustomProgressIndicator();
      }),
    );
  }

  onPokemonSelected({required Pokemon pokemon, required BuildContext context}) {
    if (pokemon.name != null && pokemon.name!.isNotEmpty) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PokemonDetails(pokemonName: pokemon.name!),
          ));
    }
  }
}
