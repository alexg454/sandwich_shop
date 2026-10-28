import 'package:sandwich_shop/models/sandwich.dart';

class SandwichRepository {
  List<Sandwich> getSandwiches() {
    return const [
      Sandwich(
      id: 'footlong', 
      name: 'Footlong Sub', 
      description: 'A foot long sandwich', 
      price: 7.50,
      imagePath: 'assets/images/footlong.jpeg'
      ),
      Sandwich(
        id: 'six-inch',
        name: 'Six-inch Sub',
        description: 'A six-inch long sandwich',
        price: 4.50,
        imagePath: 'assets/images/six_inch.jpeg'
      )
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
}