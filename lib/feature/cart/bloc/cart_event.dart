// Specifies that this file is a part of 'cart_bloc.dart'.
// This enables the BLoC file to use the classes and definitions provided here.
part of 'cart_bloc.dart';

// Base class for all cart-related events.
// Marked as sealed to ensure all possible events are explicitly declared.
// @immutable indicates that instances of this class are immutable, promoting safe state management.
@immutable
sealed class CartEvent {}

// Event triggered to initialize the cart.
// Typically used to load the current cart items when the cart screen is opened or refreshed.
class CartInitialEvent extends CartEvent {}

// Event triggered to remove an item from the cart.
// Contains a required field `productDataModel` to specify which product should be removed.
class CartRemoveFromCartEvent extends CartEvent {
  // The product data model instance representing the item to be removed.
  final ProductDataModel productDataModel;

  // Constructor to initialize the `productDataModel`.
  // The `required` keyword ensures this parameter must be passed when creating an instance.
  CartRemoveFromCartEvent({required this.productDataModel});
}
