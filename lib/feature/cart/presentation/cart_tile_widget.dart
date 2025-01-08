import 'package:flutter/material.dart';
import 'package:simple_grocery_app_using_bloc/feature/cart/bloc/cart_bloc.dart';
import 'package:simple_grocery_app_using_bloc/feature/home/models/home_product_data_model.dart';

// StatelessWidget for displaying a cart item tile.
class CartTileWidget extends StatelessWidget {
  // The CartBloc instance to handle cart-related actions.
  final CartBloc cartBloc;
  // The product data model representing the product to display in the cart.
  final ProductDataModel productDataModel;

  // Constructor for CartTileWidget, required to pass cartBloc and productDataModel.
  const CartTileWidget({
    super.key,
    required this.cartBloc,
    required this.productDataModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Margin and padding for the tile.
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border:
            Border.all(color: Colors.black), // Border for the cart item tile.
        borderRadius:
            BorderRadius.circular(10), // Rounded corners for the tile.
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment
            .start, // Aligning the column content to the start.
        children: [
          // Product image section
          Container(
            height: 200, // Height of the product image.
            width: double.maxFinite, // Width of the product image (full width).
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover, // Ensuring the image covers the container.
                image: NetworkImage(productDataModel
                    .imageURL), // Displaying the product image from a URL.
              ),
            ),
          ),
          const SizedBox(
            height: 20, // Spacing between the image and text.
          ),
          // Product name
          Text(
            productDataModel.name, // Displaying the product name.
            style: const TextStyle(
              fontWeight: FontWeight.bold, // Making the product name bold.
              fontSize: 18, // Font size for the product name.
            ),
          ),
          // Product description
          Text(
            productDataModel.desc, // Displaying the product description.
          ),
          const SizedBox(
            height: 20, // Spacing between the description and price.
          ),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween, // Spacing the row items apart.
            children: [
              // Product price
              Text(
                '\$${productDataModel.price}', // Displaying the product price.
                style: const TextStyle(
                  fontWeight: FontWeight.bold, // Making the price bold.
                  fontSize: 18, // Font size for the price.
                ),
              ),
              // Remove item from cart button
              IconButton(
                onPressed: () {
                  // Triggering CartRemoveFromCartEvent when the remove button is pressed.
                  cartBloc.add(
                    CartRemoveFromCartEvent(productDataModel: productDataModel),
                  );
                },
                icon: const Icon(
                  Icons
                      .shopping_cart, // Shopping cart icon to represent the remove action.
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
