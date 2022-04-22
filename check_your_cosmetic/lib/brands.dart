import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

class BrandsList {
  List<Brand> brands;

  BrandsList({required this.brands});
}

class Brand {
  final String id;
  late final String name;

  Brand({required this.id, required this.name});
}

Future<BrandsList> getBrandsList() async {
  const url = "http://checkcosmetic.net/decoder.php";
  final responce = await http.get(Uri.parse(url));

  if (responce.statusCode == 200) {
    var document = parse(responce.body);

    List elements = document.getElementsByTagName('option');

    List<Brand> br = [];
    for (var element in elements) {
      String value = element.text;
      String valueId = element.attributes['value'] as String;
      br.add(Brand(id: valueId, name: value));
    }
    return BrandsList(brands: br);
  } else {
    throw Exception('Error: ${responce.reasonPhrase}');
  }
}
