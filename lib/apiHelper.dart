import 'dart:convert';
import 'album.dart';
import 'package:http/http.dart'as http;

Future<List<Album>> fetchAlbum() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/'));
  if (response.statusCode == 200) {
    List<Album> albums = (json.decode(response.body) as List)
        .map((data) => Album.fromJson(data))
        .toList();
    return albums;
  } else {
    throw Exception("Le chargement de l'album a achoué");
  }
}