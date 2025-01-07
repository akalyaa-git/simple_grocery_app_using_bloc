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
  final WishlistBloc wishlistBloc = WishlistBloc();
  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'WishList Items',
        ),
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listener: (context, state) {
          if (state is WishlistRemovedActionState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Item removed from the wishlist'),
              ),
            );
          }
        },
        listenWhen: (previousState, currentState) =>
        currentState is WishlistActionState,
        buildWhen: (previousState, currentState) =>
        currentState is! WishlistActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishlistSuccessState:
              final successState = state as WishlistSuccessState;
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
              return const SizedBox();
          }
        },
      ),
    );
  }
}
