import 'package:flutter/material.dart';
import 'package:simple_grocery_app_using_bloc/feature/home/bloc/home_bloc.dart';
import 'package:simple_grocery_app_using_bloc/feature/home/models/home_product_data_model.dart';

// ProductTileWidget displays each product in a grid or list format.
class ProductTileWidget extends StatelessWidget {
  final HomeBloc homeBloc; // The HomeBloc instance to handle events.
  final ProductDataModel productDataModel; // The product data to display.

  // Constructor to accept the HomeBloc and ProductDataModel.
  const ProductTileWidget({
    super.key,
    required this.homeBloc, // Bloc to handle events when user interacts with the product.
    required this.productDataModel, // Product data that will be shown in the widget.
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10), // Margin around the tile.
      padding: const EdgeInsets.all(10), // Padding inside the tile.
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black), // Border around the tile.
        borderRadius:
            BorderRadius.circular(10), // Rounded corners for the tile.
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Align text and elements to the left.
        children: [
          Container(
            height: 200, // Fixed height for the image.
            width: double.maxFinite, // Take the full available width.
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover, // Cover the area of the image container.
                image: NetworkImage(
                    productDataModel.imageURL), // Load image from URL.
              ),
            ),
          ),
          const SizedBox(
            height: 20, // Space between image and text.
          ),
          Text(
            productDataModel.name, // Display product name.
            style: const TextStyle(
              fontWeight: FontWeight.bold, // Make the name bold.
              fontSize: 18, // Set font size for the name.
            ),
          ),
          Text(
            productDataModel.desc, // Display product description.
          ),
          const SizedBox(
            height: 20, // Space between description and price/buttons.
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment
                .spaceBetween, // Align price and buttons on opposite sides.
            children: [
              Text(
                '\$${productDataModel.price}', // Display product price.
                style: const TextStyle(
                  fontWeight: FontWeight.bold, // Make the price bold.
                  fontSize: 18, // Set font size for the price.
                ),
              ),
              Row(
                children: [
                  // IconButton for adding product to Wishlist.
                  IconButton(
                    onPressed: () {
                      // Add event to HomeBloc to handle Wishlist button click.
                      homeBloc.add(
                        HomeProductWishlistButtonClickedEvent(
                          clickedProduct:
                              productDataModel, // Pass the clicked product.
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons
                          .favorite_border_outlined, // Heart icon for Wishlist.
                    ),
                  ),
                  // IconButton for adding product to Cart.
                  IconButton(
                    onPressed: () {
                      // Add event to HomeBloc to handle Cart button click.
                      homeBloc.add(
                        HomeProductCartButtonClickedEvent(
                          clickedProduct:
                              productDataModel, // Pass the clicked product.
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.shopping_cart_outlined, // Shopping cart icon.
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
