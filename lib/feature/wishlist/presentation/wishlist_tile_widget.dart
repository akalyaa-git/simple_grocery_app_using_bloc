import 'package:flutter/material.dart';
import 'package:simple_grocery_app_using_bloc/feature/home/models/home_product_data_model.dart';
import 'package:simple_grocery_app_using_bloc/feature/wishlist/bloc/wishlist_bloc.dart';

class WishListTileWidget extends StatelessWidget {
  final WishlistBloc wishlistBloc;
  final ProductDataModel productDataModel;
  const WishListTileWidget({
    super.key,
    required this.wishlistBloc,
    required this.productDataModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(productDataModel.imageURL),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            productDataModel.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Text(
            productDataModel.desc,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${productDataModel.price}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              IconButton(
                onPressed: () {
                  wishlistBloc.add(
                    WishlistRemoveFromWishlistEvent(productDataModel: productDataModel),
                  );
                },
                icon: const Icon(
                  Icons.favorite,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
