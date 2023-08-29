import '../../domain/entities/pokemon.dart';

class PokemonListModel {
  int? count;
  String? next;
  int? previous;
  List<PokemonModel>? results;

  PokemonListModel({this.count, this.next, this.previous, this.results});

  PokemonListModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <PokemonModel>[];
      json['results'].forEach((v) {
        results!.add(PokemonModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['next'] = next;
    data['previous'] = previous;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PokemonModel {
  String? name;
  String? url;

  PokemonModel({this.name, this.url});

  PokemonModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}

extension PokemonModelExtension on PokemonModel {
  Pokemon get toPokemon => Pokemon(name: name, url: url);
}
