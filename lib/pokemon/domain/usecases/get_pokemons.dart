import 'package:dartz/dartz.dart';

import '../../../shared/network/failures.dart';
import '../entities/pokemon.dart';
import '../repositories/pokemon_repository.dart';

/*
  use-case specifically for getting pokemon list
*/
class GetPokemons {
  final PokemonRepository repository;

  GetPokemons({required this.repository});

  Future<Either<Failure, List<Pokemon>>> execute(
      {required int limit, required int offset}) async {
    return repository.getPokemonsList(limit: limit, offset: offset);
  }
}
