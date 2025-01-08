part of 'wishlist_bloc.dart'; // Import the main wishlist bloc file

@immutable
sealed class WishlistState {} // Base class for all wishlist states, ensures immutability

// A base class for all action-related states (states that indicate some action is happening).
sealed class WishlistActionState extends WishlistState {}

// Represents the initial state of the wishlist (before any data is loaded)
final class WishlistInitial extends WishlistState {}

// Represents a successful state when the wishlist is successfully loaded
class WishlistSuccessState extends WishlistState {
  final List<ProductDataModel>
      wishlistItems; // List of items currently in the wishlist

  // Constructor to initialize the wishlistItems
  WishlistSuccessState({
    required this.wishlistItems,
  });
}

// Represents a state indicating that an item was successfully removed from the wishlist
class WishlistRemovedActionState extends WishlistActionState {}
