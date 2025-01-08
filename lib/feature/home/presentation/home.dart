import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_grocery_app_using_bloc/feature/cart/presentation/cart.dart';
import 'package:simple_grocery_app_using_bloc/feature/home/bloc/home_bloc.dart';
import 'package:simple_grocery_app_using_bloc/feature/home/presentation/product_tile_widget.dart';
import 'package:simple_grocery_app_using_bloc/feature/wishlist/presentation/wishlist.dart';

// Home page widget that represents the main page of the app.
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Initializing the HomeBloc.
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    // Triggering the HomeInitialEvent to load the products when the Home screen is initialized.
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc, // Specifying the bloc to be used for state management.
      listenWhen: (previousState, currentState) => currentState
          is HomeActionState, // Only react to action-related states.
      buildWhen: (previousState, currentState) => currentState
          is! HomeActionState, // Only rebuild UI when the state is not an action state.
      listener: (context, state) {
        // Handling various state changes with navigation or UI updates.
        if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  const Wishlist(), // Navigate to Wishlist page.
            ),
          );
        } else if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Cart(), // Navigate to Cart page.
            ),
          );
        } else if (state is HomeProductItemWishListedActionState) {
          // Show snack bar message when an item is added to the wishlist.
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Item added to Wishlist'),
            ),
          );
        } else if (state is HomeProductItemsCartedActionState) {
          // Show snack bar message when an item is added to the cart.
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Item added to Cart'),
            ),
          );
        }
      },
      builder: (context, state) {
        // Depending on the state, build the appropriate UI.
        switch (state.runtimeType) {
          case HomeLoadingState:
            // Show a loading indicator while data is being fetched.
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          case HomeLoadedSuccessState:
            // State when products are successfully loaded, show the products.
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                title: const Text('Grocery App'),
                backgroundColor: Colors.teal,
                actions: [
                  // Wishlist navigation button.
                  IconButton(
                    onPressed: () {
                      homeBloc.add(
                          HomeWishlistButtonNavigateEvent()); // Trigger wishlist navigation event.
                    },
                    icon: const Icon(Icons.favorite_border_outlined),
                  ),
                  // Cart navigation button.
                  IconButton(
                    onPressed: () {
                      homeBloc.add(
                          HomeCartButtonNavigateEvent()); // Trigger cart navigation event.
                    },
                    icon: const Icon(Icons.shopping_cart_outlined),
                  ),
                ],
              ),
              body: ListView.builder(
                itemCount: successState.products.length, // List all products.
                itemBuilder: (context, index) {
                  // Return a widget for each product.
                  return ProductTileWidget(
                    homeBloc: homeBloc, // Pass the bloc to the product widget.
                    productDataModel:
                        successState.products[index], // Pass the product data.
                  );
                },
              ),
            );
          case HomeErrorState:
            // State when an error occurs, show an error message.
            return const Scaffold(
              body: Center(
                child: Text('Error'), // Error message for the user.
              ),
            );
          default:
            // Return an empty box in case no state is matched.
            return const SizedBox();
        }
      },
    );
  }
}
