import 'package:exp_practical_test/pokemon/data/datasource/pokemon_datasource.dart';
import 'package:exp_practical_test/pokemon/data/repositories/pokemon_repository_impl.dart';
import 'package:exp_practical_test/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:exp_practical_test/pokemon/domain/usecases/get_pokemon_details.dart';
import 'package:exp_practical_test/pokemon/domain/usecases/get_pokemons.dart';
import 'package:exp_practical_test/pokemon/presentation/blocs/pokemon_details/pokemon_details_bloc.dart';
import 'package:exp_practical_test/pokemon/presentation/blocs/pokemon_list/pokemon_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  // Pokemon:

  // Data

  // DataSources
  sl.registerLazySingleton<PokemonDataSource>(
          () => PokemonDataSourceImpl(client: sl()));

  // Repositories
  sl.registerLazySingleton<PokemonRepository>(
          () => PokemonRepositoryImpl(pokemonDataSource: sl()));

  // Domain

  // Usecases
  sl.registerLazySingleton(() => GetPokemons(repository: sl()));
  sl.registerLazySingleton(() => GetPokemonDetails(repository: sl()));

  // Presentation

  // BLoC
  sl.registerFactory(() => PokemonBloc(getPokemonUsecase: sl()));
  sl.registerFactory(() => PokemonDetailsBloc(getPokemonDetailsUsecase: sl()));

  // Misc
  sl.registerLazySingleton(() => http.Client());
}