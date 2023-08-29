import 'package:exp_practical_test/pokemon/presentation/blocs/pokemon_details/pokemon_details_bloc.dart';
import 'package:exp_practical_test/pokemon/presentation/widgets/custom_progress_indicator.dart';
import 'package:exp_practical_test/pokemon/presentation/widgets/error_message_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/pokemon_detail_widget.dart';

class PokemonDetails extends StatefulWidget {
  final String pokemonName;

  const PokemonDetails({super.key, required this.pokemonName});

  @override
  State<PokemonDetails> createState() => _PokemonDetailsState();
}

class _PokemonDetailsState extends State<PokemonDetails> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<PokemonDetailsBloc>(context)
        .add(GetPokemonDetailsEvent(pokemonName: widget.pokemonName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Pokemon Details")),
      ),
      body: BlocBuilder<PokemonDetailsBloc, PokemonDetailsState>(
          builder: (context, state) {
        if (state is PokemonDetailsLoading) {
          return const CustomProgressIndicator();
        } else if (state is PokemonDetailsLoadedWithSuccess) {
          return PokemonDetailWidget( state: state);
        } else if (state is PokemonDetailsLoadedWithError) {
          return ErrorMessageView(message: state.message);
        }
        return const CustomProgressIndicator();
      }),
    );
  }
}

