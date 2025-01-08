// Specifies that this file is a part of 'cart_bloc.dart'.
// This allows the BLoC implementation to use the states defined here.
part of 'cart_bloc.dart';

// Base class for all cart-related states.
// Marked as sealed to ensure all possible states are explicitly declared.
// @immutable ensures the state objects are immutable, supporting safe state management.
@immutable
sealed class CartState {}

// A specialized base class for states that represent user actions (e.g., removing an item).
// Inherits from `CartState` and helps differentiate action states from other cart states.
sealed class CartActionState extends CartState {}

// Represents the initial state of the cart before any action or data is loaded.
class CartInitial extends CartState {}

// Represents a successful state where the cart items are available.
// Holds a list of `ProductDataModel` representing the items in the cart.
class CartSuccessState extends CartState {
  final List<ProductDataModel>
      cartItems; // The list of items currently in the cart.

  // Constructor requires the `cartItems` list to initialize the state.
  CartSuccessState({
    required this.cartItems,
  });
}

// Represents a state triggered after an item is removed from the cart.
// Extends `CartActionState` to indicate that it's an action-specific state.
class CartRemovedActionState extends CartActionState {}
