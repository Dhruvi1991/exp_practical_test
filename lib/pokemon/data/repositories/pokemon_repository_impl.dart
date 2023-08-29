import 'package:dartz/dartz.dart';
import 'package:exp_practical_test/pokemon/data/models/pokemon_details_model.dart';
import 'package:exp_practical_test/pokemon/data/models/pokemon_list_model.dart';
import 'package:exp_practical_test/shared/network/failures.dart';
import '../../domain/entities/pokemon.dart';
import '../../domain/entities/pokemon_details.dart';
import '../../domain/repositories/pokemon_repository.dart';
import '../datasource/pokemon_datasource.dart';

class PokemonRepositoryImpl implements PokemonRepository{

  final PokemonDataSource pokemonDataSource;

  PokemonRepositoryImpl({required this.pokemonDataSource});

  /*
    return failure or entity for successful pokemon details response
  */
  @override
  Future<Either<Failure, PokemonDetails>> getPokemonDetails({required String pokemonName}) async {
    try {
      final pokemonDetailModels = await pokemonDataSource.getPokemonDetails(pokemonName: pokemonName);
      final pokemonDetails = pokemonDetailModels.toPokemonDetails;
      return Right(pokemonDetails);
    } catch (error) {
      return Left(ServerFailure(message: error.toString()));
    }
  }

  /*
    return failure or entity for successful pokemon list response
  */
  @override
  Future<Either<Failure, List<Pokemon>>> getPokemonsList({required int limit, required int offset}) async {
    try {
      final pokemonModels = await pokemonDataSource.getPokemons(limit: limit,offset: offset);
      final pokemoms = pokemonModels.map((e) => e.toPokemon).toList();
      return Right(pokemoms);
    } catch (error) {
      return Left(ServerFailure(message: error.toString()));
    }
  }

}