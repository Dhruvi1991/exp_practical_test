import 'dart:io';

import 'package:exp_practical_test/shared/network/response_handler.dart';
import 'package:exp_practical_test/shared/utils/error_messages.dart';
import 'package:exp_practical_test/shared/network/exceptions.dart';
import 'package:http/http.dart' as http;

import '../../../shared/utils/string_constants.dart';
import '../models/pokemon_details_model.dart';
import '../models/pokemon_list_model.dart';

abstract class PokemonDataSource {
  Future<List<PokemonModel>> getPokemons(
      {required int limit, required int offset});

  Future<PokemonDetailsModel> getPokemonDetails({required String pokemonName});
}

class PokemonDataSourceImpl extends PokemonDataSource {
  final http.Client client;

  PokemonDataSourceImpl({required this.client});

  ResponseHandler handler = ResponseHandler();

  /*
    return pokemon details data from the API
  */
  @override
  Future<PokemonDetailsModel> getPokemonDetails(
      {required String pokemonName}) async {
    //path for pokemon details API
    final path = "/pokemon/$pokemonName";
    try {
      final response = await client.get(Uri.parse(baseUrl + path), headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
      });
      var responseJson = handler.getResponseData(response);
      return PokemonDetailsModel.fromJson(responseJson);
    } on SocketException catch (_) {
      throw networkError;
    } catch (e) {
      if (e is ServerException) rethrow;
      throw e.toString();
    }
  }

  /*
    return pokemon list data from the API
  */
  @override
  Future<List<PokemonModel>> getPokemons(
      {required int limit, required int offset}) async {
    //path for pokemon list API
    final path = "/pokemon?limit=$limit&offset=$offset";

    try {
      final response = await client.get(Uri.parse(baseUrl + path), headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
      });
      var responseJson = handler.getResponseData(response)['results'];
      return (responseJson as List)
          .map((e) => PokemonModel.fromJson(e))
          .toList();
    } on SocketException catch (_) {
      throw networkError;
    } catch (e) {
      if (e is ServerException) rethrow;
      throw e.toString();
    }
  }
}
