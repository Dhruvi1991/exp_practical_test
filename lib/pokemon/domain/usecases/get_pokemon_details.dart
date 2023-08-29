import 'package:dartz/dartz.dart';

import '../../../shared/network/failures.dart';
import '../entities/pokemon_details.dart';
import '../repositories/pokemon_repository.dart';

/*
  use-case specifically for getting pokemon details
*/
class GetPokemonDetails {
  final PokemonRepository repository;

  GetPokemonDetails({required this.repository});

  Future<Either<Failure, PokemonDetails>> execute(
      {required String name}) async {
    return repository.getPokemonDetails(pokemonName: name);
  }
}
