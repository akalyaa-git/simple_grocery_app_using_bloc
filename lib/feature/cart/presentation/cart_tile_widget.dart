import 'package:flutter/material.dart';
import 'package:simple_grocery_app_using_bloc/feature/cart/bloc/cart_bloc.dart';
import 'package:simple_grocery_app_using_bloc/feature/home/models/home_product_data_model.dart';

class CartTileWidget extends StatelessWidget {
  final CartBloc cartBloc;
  final ProductDataModel productDataModel;
  const CartTileWidget({
    super.key,
    required this.cartBloc,
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
                  cartBloc.add(
                    CartRemoveFromCartEvent(productDataModel: productDataModel),
                  );
                },
                icon: const Icon(
                  Icons.shopping_cart,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
