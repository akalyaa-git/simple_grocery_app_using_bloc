import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_grocery_app_using_bloc/feature/cart/bloc/cart_bloc.dart';
import 'package:simple_grocery_app_using_bloc/feature/cart/presentation/cart_tile_widget.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cartBloc = CartBloc();
  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cart Items',
        ),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listener: (context, state) {
          if (state is CartRemovedActionState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Item removed from the cart'),
              ),
            );
          }
        },
        listenWhen: (previousState, currentState) =>
            currentState is CartActionState,
        buildWhen: (previousState, currentState) =>
            currentState is! CartActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccessState:
              final successState = state as CartSuccessState;
              return ListView.builder(
                itemCount: successState.cartItems.length,
                itemBuilder: (context, index) {
                  return CartTileWidget(
                    cartBloc: cartBloc,
                    productDataModel: successState.cartItems[index],
                  );
                },
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
