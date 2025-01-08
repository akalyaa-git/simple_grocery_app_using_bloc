part of 'wishlist_bloc.dart'; // Import the main wishlist bloc file

@immutable
sealed class WishlistEvent {} // Base class for all wishlist events, ensures immutability

// Event to initialize the wishlist (e.g., fetching the list of items)
class WishlistInitialEvent extends WishlistEvent {}

// Event for removing a product from the wishlist
class WishlistRemoveFromWishlistEvent extends WishlistEvent {
  final ProductDataModel
      productDataModel; // Product to be removed from wishlist

  // Constructor to initialize the productDataModel
  WishlistRemoveFromWishlistEvent({required this.productDataModel});
}
