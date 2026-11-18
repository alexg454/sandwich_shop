import 'package:sandwich_shop/models/sandwich.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class SandwichRepository {
  List<Sandwich>? _cachedSandwiches;

  List<Sandwich> getSandwiches() {
    final List<Sandwich>? cachedSandwiches = _cachedSandwiches;
    if (cachedSandwiches != null) {
      return cachedSandwiches;
    }
    
    return const [
      Sandwich(
        id: 'footlong',
        name: 'Footlong Sub',
        description: 'A foot long sandwich',
        price: 7.50,
        imagePath: 'assets/images/footlong.jpeg',
      ),
      Sandwich(
        id: 'six-inch',
        name: 'Six-inch Sub',
        description: 'A six-inch long sandwich',
        price: 4.50,
        imagePath: 'assets/images/six_inch.jpeg',
      ),
    ];
  }

  Sandwich? getSandwichById(String id) {
    for (final sandwich in getSandwiches()) {
      if (sandwich.id == id) {
        return sandwich;
      }
    }
    return null;
  }

  Future<List<Sandwich>> loadSandwichesFromAsset({
    String assetPath = 'assets/data/sandwiches.json'
  }) async {
    final String jsonString = await rootBundle.loadString(assetPath);
    final dynamic decodedData = jsonDecode(jsonString);
    final List<dynamic> jsonList = decodedData as List<dynamic>;
    final List<Sandwich> loadedSandwiches = [];

    for (final dynamic item in jsonList) {
      final Map<String, dynamic> itemMap = item as Map<String, dynamic>;
      final Sandwich sandwich = Sandwich.fromJson(itemMap);
      loadedSandwiches.add(sandwich);
    }

    _cachedSandwiches = loadedSandwiches;
    return loadedSandwiches;
  }
}
