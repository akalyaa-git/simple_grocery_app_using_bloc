part of 'home_bloc.dart'; // Importing the Home BLoC part file.

// Declaring HomeEvent as an abstract sealed class to represent all possible events.
@immutable
sealed class HomeEvent {}

// Event triggered when the home page is initialized.
class HomeInitialEvent extends HomeEvent {}

// Event triggered when the wishlist button for a product is clicked.
class HomeProductWishlistButtonClickedEvent extends HomeEvent {
  // The product that was clicked to add to the wishlist.
  final ProductDataModel clickedProduct;

  // Constructor for the event, requiring the clicked product to be passed in.
  HomeProductWishlistButtonClickedEvent({
    required this.clickedProduct,
  });
}

// Event triggered when the cart button for a product is clicked.
class HomeProductCartButtonClickedEvent extends HomeEvent {
  // The product that was clicked to add to the cart.
  final ProductDataModel clickedProduct;

  // Constructor for the event, requiring the clicked product to be passed in.
  HomeProductCartButtonClickedEvent({
    required this.clickedProduct,
  });
}

// Event triggered when the wishlist button in the app bar is clicked to navigate.
class HomeWishlistButtonNavigateEvent extends HomeEvent {}

// Event triggered when the cart button in the app bar is clicked to navigate.
class HomeCartButtonNavigateEvent extends HomeEvent {}
