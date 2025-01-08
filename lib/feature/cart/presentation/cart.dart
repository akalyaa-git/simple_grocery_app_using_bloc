import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_grocery_app_using_bloc/feature/cart/bloc/cart_bloc.dart';
import 'package:simple_grocery_app_using_bloc/feature/cart/presentation/cart_tile_widget.dart';

// StatefulWidget for the Cart screen.
class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

// State class for the Cart widget.
class _CartState extends State<Cart> {
  // Instance of CartBloc to manage cart states and events.
  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    // Triggering the initial event to load the cart items.
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // AppBar title for the Cart screen.
        title: const Text(
          'Cart Items',
        ),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc, // Specifying the BLoC instance.
        listener: (context, state) {
          // Listening for specific action states to show feedback to the user.
          if (state is CartRemovedActionState) {
            // Displaying a SnackBar when an item is removed from the cart.
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Item removed from the cart'),
              ),
            );
          }
        },
        // Only listen when the new state is a CartActionState.
        listenWhen: (previousState, currentState) =>
            currentState is CartActionState,
        // Only rebuild the UI when the new state is not a CartActionState.
        buildWhen: (previousState, currentState) =>
            currentState is! CartActionState,
        builder: (context, state) {
          // Handling different cart states to build the UI.
          switch (state.runtimeType) {
            case CartSuccessState:
              // Casting the state to CartSuccessState to access cart items.
              final successState = state as CartSuccessState;
              return ListView.builder(
                itemCount: successState
                    .cartItems.length, // Number of items in the cart.
                itemBuilder: (context, index) {
                  // Building each cart item using CartTileWidget.
                  return CartTileWidget(
                    cartBloc:
                        cartBloc, // Passing the CartBloc to handle actions.
                    productDataModel: successState
                        .cartItems[index], // Passing the product data.
                  );
                },
              );
            default:
              // Default fallback UI for unsupported states.
              return const SizedBox();
          }
        },
      ),
    );
  }
}
