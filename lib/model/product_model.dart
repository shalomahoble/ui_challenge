// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  final String name;
  final double price;
  final String description;
  final String image;
  Product({
    required this.description,
    required this.name,
    required this.price,
    required this.image,
  });
}


  List<Product> products = [
    Product(
      name: "Lucky Jade Plant",
      price: 12.99,
      description:
          "Lorem Ipsum er ganske enkelt fyldtekst fra print- og typografiindustrien. Lorem Ipsum har været standard fyldtekst siden 1500-tallet, hvor en ukendt trykker sammensatte en tilfældig",
      image: 'assets/images/01.png',
    ),
    Product(
      name: "Shake Plant",
      price: 40.99,
      description:
          "Lorem Ipsum er ganske enkelt fyldtekst fra print- og typografiindustrien. Lorem Ipsum har været standard fyldtekst siden 1500-tallet, hvor en ukendt trykker sammensatte en tilfældig",
      image: 'assets/images/02.png',
    ),
    Product(
      name: "Small Plant",
      price: 10.99,
      description:
          "Lorem Ipsum er ganske enkelt fyldtekst fra print- og typografiindustrien. Lorem Ipsum har været standard fyldtekst siden 1500-tallet, hvor en ukendt trykker sammensatte en tilfældig",
      image: 'assets/images/03.png',
    ),
    Product(
      name: "Peperomia Plant",
      description:
          "Lorem Ipsum er ganske enkelt fyldtekst fra print- og typografiindustrien. Lorem Ipsum har været standard fyldtekst siden 1500-tallet, hvor en ukendt trykker sammensatte en tilfældig",
      price: 100.99,
      image: 'assets/images/05.png',
    ),
    Product(
      name: "Shake Plant",
      description:
          "Lorem Ipsum er ganske enkelt fyldtekst fra print- og typografiindustrien. Lorem Ipsum har været standard fyldtekst siden 1500-tallet, hvor en ukendt trykker sammensatte en tilfældig",
      price: 100.99,
      image: 'assets/images/08.png',
    ),
    Product(
      name: "Shake Plant",
      description:
          "Lorem Ipsum er ganske enkelt fyldtekst fra print- og typografiindustrien. Lorem Ipsum har været standard fyldtekst siden 1500-tallet, hvor en ukendt trykker sammensatte en tilfældig",
      price: 120.99,
      image: 'assets/images/09.png',
    ),
    Product(
      name: "Lucky Jade Plant",
      description:
          "Lorem Ipsum er ganske enkelt fyldtekst fra print- og typografiindustrien. Lorem Ipsum har været standard fyldtekst siden 1500-tallet, hvor en ukendt trykker sammensatte en tilfældig",
      price: 70.99,
      image: 'assets/images/10.png',
    ),
    Product(
      name: "Peperomia Plant",
      description:
          "Lorem Ipsum er ganske enkelt fyldtekst fra print- og typografiindustrien. Lorem Ipsum har været standard fyldtekst siden 1500-tallet, hvor en ukendt trykker sammensatte en tilfældig",
      price: 30.99,
      image: 'assets/images/11.png',
    ),
  ];