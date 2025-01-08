// Class representing a product's data model.
class ProductDataModel {
  // Unique identifier for the product.
  final String id;

  // Name of the product.
  final String name;

  // Description of the product.
  final String desc;

  // Price of the product.
  final double price;

  // URL of the product's image.
  final String imageURL;

  // Constructor to initialize the product data.
  ProductDataModel({
    required this.id, // Product ID, required for identification.
    required this.name, // Product name, required to display the product's name.
    required this.desc, // Product description, required for providing additional information.
    required this.price, // Product price, required to display the product's price.
    required this.imageURL, // Product image URL, required for displaying the product image.
  });
}
