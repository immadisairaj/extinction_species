import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:extinction_species/species/all_species.dart';
import 'package:extinction_species/species/link.dart';
import 'package:extinction_species/species/specie.dart';

String url = 'https://apiv3.iucnredlist.org/api/v3';
String token =
    'token=9bb4facb6d23f48efbf424bb05c0c1ef1cf6f468393bc745d42179ac4aca5fee';

Future<AllSpecies> getAllSpecies(String? type) async {
  final responce =
      await http.get(Uri.parse('$url/species/category/$type?$token'));
  print(responce.body);
  return allSpeciesFromJson(responce.body);
}

Future<String?> getLink(String? name) async {
  final responce = await http.get(Uri.parse('$url/weblink/$name'));
  print(responce.body);
  Link link = linkFromJson(responce.body);
  return link.rlurl;
}

Future<Specie> getSpecie(int? id) async {
  final responce =
      await http.get(Uri.parse('$url/species/narrative/id/$id?$token'));
  print(responce.body);
  return specieFromJson(responce.body);
}
