import 'package:flutter/material.dart';
import 'package:simple_grocery_app_using_bloc/feature/home/models/home_product_data_model.dart';
import 'package:simple_grocery_app_using_bloc/feature/wishlist/bloc/wishlist_bloc.dart';

class WishListTileWidget extends StatelessWidget {
  // Bloc instance to manage wishlist state and remove products from the wishlist
  final WishlistBloc wishlistBloc;

  // Product data model representing the details of each product in the wishlist
  final ProductDataModel productDataModel;

  // Constructor to receive wishlistBloc and productDataModel
  const WishListTileWidget({
    super.key,
    required this.wishlistBloc,
    required this.productDataModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10), // Margin for the tile
      padding: const EdgeInsets.all(10), // Padding inside the tile
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black), // Border around the tile
        borderRadius: BorderRadius.circular(10), // Rounded corners for the tile
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Align content to the left
        children: [
          // Container for product image with network image URL
          Container(
            height: 200, // Set height for the image
            width:
                double.maxFinite, // Set the image width to full available width
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit
                    .cover, // Image should cover the entire container area
                image: NetworkImage(
                    productDataModel.imageURL), // Load image from URL
              ),
            ),
          ),
          const SizedBox(
            height: 20, // Space between image and text
          ),
          // Product name displayed in bold
          Text(
            productDataModel.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold, // Bold text style
              fontSize: 18, // Font size for product name
            ),
          ),
          // Product description text below the name
          Text(
            productDataModel.desc,
          ),
          const SizedBox(
            height: 20, // Space before price and action buttons
          ),
          // Row containing product price and remove button
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween, // Space out the elements
            children: [
              // Display the product price in bold
              Text(
                '\$${productDataModel.price}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold, // Bold text style for price
                  fontSize: 18, // Font size for price
                ),
              ),
              // Icon button to remove product from wishlist
              IconButton(
                onPressed: () {
                  // Dispatch event to remove the product from wishlist
                  wishlistBloc.add(
                    WishlistRemoveFromWishlistEvent(
                        productDataModel: productDataModel),
                  );
                },
                icon: const Icon(
                  Icons.favorite, // Heart icon to signify wishlist
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
