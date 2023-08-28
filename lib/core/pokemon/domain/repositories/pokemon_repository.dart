import 'package:dartz/dartz.dart';
import 'package:exp_practical_test/core/pokemon/data/models/pokemon_details.dart';
import 'package:exp_practical_test/core/pokemon/data/models/pokemon_list.dart';

abstract class PokemonRepository{
  Future<Either<Fail, List<Pokemon>>> getPokemonsList({required int limit});

  Future<Either<Fail, PokemonDetails>> getPokemonDetails({required String pokemonName});
}