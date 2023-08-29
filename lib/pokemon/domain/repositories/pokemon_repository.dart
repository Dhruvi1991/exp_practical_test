import 'package:dartz/dartz.dart';
import 'package:exp_practical_test/shared/network/failures.dart';

import '../entities/pokemon.dart';
import '../entities/pokemon_details.dart';

abstract class PokemonRepository {
  Future<Either<Failure, List<Pokemon>>> getPokemonsList(
      {required int limit, required int offset});

  Future<Either<Failure, PokemonDetails>> getPokemonDetails(
      {required String pokemonName});
}
