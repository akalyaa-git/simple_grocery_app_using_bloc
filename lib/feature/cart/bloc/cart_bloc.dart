import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:simple_grocery_app_using_bloc/data/cart_items.dart';
import 'package:simple_grocery_app_using_bloc/feature/home/models/home_product_data_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

// Bloc class for managing cart-related states and events.
class CartBloc extends Bloc<CartEvent, CartState> {
  // Constructor initializes the BLoC with the initial state.
  CartBloc() : super(CartInitial()) {
    // Registering event handlers for specific events.
    on<CartInitialEvent>(
        cartInitialEvent); // Handles the initial loading of the cart.
    on<CartRemoveFromCartEvent>(
        cartRemoveFromCartEvent); // Handles removing an item from the cart.
  }

  // Event handler for initializing the cart.
  // Emits a success state with the current list of cart items.
  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: cartItems)); // Emit current cart items.
  }

  // Event handler for removing an item from the cart.
  // Removes the specified product from the cart and emits updated states.
  FutureOr<void> cartRemoveFromCartEvent(
      CartRemoveFromCartEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.productDataModel); // Remove the item from the cart.
    emit(
        CartRemovedActionState()); // Emit a state indicating an item was removed.
    emit(
        CartSuccessState(cartItems: cartItems)); // Emit the updated cart items.
  }
}
