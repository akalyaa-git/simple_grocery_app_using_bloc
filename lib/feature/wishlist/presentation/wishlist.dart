import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_grocery_app_using_bloc/feature/wishlist/bloc/wishlist_bloc.dart';
import 'package:simple_grocery_app_using_bloc/feature/wishlist/presentation/wishlist_tile_widget.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  // Create an instance of the WishlistBloc to manage state changes related to the wishlist
  final WishlistBloc wishlistBloc = WishlistBloc();

  @override
  void initState() {
    // Dispatch the WishlistInitialEvent to load the initial state of the wishlist
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar for the Wishlist screen
      appBar: AppBar(
        title: const Text(
          'WishList Items', // Title displayed in the AppBar
        ),
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listener: (context, state) {
          // Show a snack bar when an item is removed from the wishlist
          if (state is WishlistRemovedActionState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Item removed from the wishlist'),
              ),
            );
          }
        },
        listenWhen: (previousState, currentState) => currentState
            is WishlistActionState, // Only listen to action-related states
        buildWhen: (previousState, currentState) => currentState
            is! WishlistActionState, // Rebuild the widget only for non-action states
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishlistSuccessState:
              final successState = state as WishlistSuccessState;
              // Return a ListView displaying the wishlist items
              return ListView.builder(
                itemCount: successState.wishlistItems.length,
                itemBuilder: (context, index) {
                  return WishListTileWidget(
                    wishlistBloc: wishlistBloc,
                    productDataModel: successState.wishlistItems[index],
                  );
                },
              );
            default:
              return const SizedBox(); // Empty space if no matching state
          }
        },
      ),
    );
  }
}
