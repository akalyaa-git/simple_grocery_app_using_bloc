import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:simple_grocery_app_using_bloc/data/cart_items.dart';
import 'package:simple_grocery_app_using_bloc/data/grocery_data.dart';
import 'package:simple_grocery_app_using_bloc/data/wishlist_items.dart';
import 'package:simple_grocery_app_using_bloc/feature/home/models/home_product_data_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  // Constructor that initializes the HomeBloc and sets up event handlers.
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(
        homeInitialEvent); // Event handler for HomeInitialEvent.
    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent); // Event handler for wishlist button click.
    on<HomeProductCartButtonClickedEvent>(
        homeProductCartButtonClickedEvent); // Event handler for cart button click.
    on<HomeWishlistButtonNavigateEvent>(
        homeWishlistButtonNavigateEvent); // Event handler for navigating to wishlist.
    on<HomeCartButtonNavigateEvent>(
        homeCartButtonNavigateEvent); // Event handler for navigating to cart.
  }

  // Event handler for HomeInitialEvent that loads the products.
  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(
        HomeLoadingState()); // Emitting a loading state while fetching products.
    await Future.delayed(
        Duration(seconds: 3)); // Simulating a delay for loading products.

    // Emitting a success state with product data after the delay.
    emit(
      HomeLoadedSuccessState(
        products: GroceryData.groceryProducts
            .map(
              (e) => ProductDataModel(
                id: e['id'],
                name: e['name'],
                desc: e['desc'],
                price: e['price'],
                imageURL: e['imageURL'],
              ),
            )
            .toList(),
      ),
    ); // Converting grocery products to a list of ProductDataModel.
  }

  // Event handler for adding a product to the wishlist.
  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    debugPrint(
        'Wishlist Clicked in Product'); // Debugging log when wishlist button is clicked.

    wishlistItems
        .add(event.clickedProduct); // Adding the clicked product to wishlist.
    emit(
        HomeProductItemWishListedActionState()); // Emitting a state indicating the product was added to wishlist.
  }

  // Event handler for adding a product to the cart.
  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    debugPrint(
        'Cart Clicked in Product'); // Debugging log when cart button is clicked.

    cartItems
        .add(event.clickedProduct); // Adding the clicked product to the cart.
    emit(
        HomeProductItemsCartedActionState()); // Emitting a state indicating the product was added to cart.
  }

  // Event handler for navigating to the wishlist page.
  FutureOr<void> homeWishlistButtonNavigateEvent(
      HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    debugPrint(
        'Wishlist Navigate Clicked on AppBar'); // Debugging log when wishlist button in AppBar is clicked.
    emit(
        HomeNavigateToWishlistPageActionState()); // Emitting a state to navigate to the wishlist page.
  }

  // Event handler for navigating to the cart page.
  FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    debugPrint(
        'Cart Navigate Clicked on AppBar'); // Debugging log when cart button in AppBar is clicked.
    emit(
        HomeNavigateToCartPageActionState()); // Emitting a state to navigate to the cart page.
  }
}
