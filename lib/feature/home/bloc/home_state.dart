part of 'home_bloc.dart'; // Importing the Home BLoC part file.

// Declaring HomeState as an abstract sealed class to represent all possible states.
@immutable
sealed class HomeState {}

// A base class for all states that represent an action within the home page.
sealed class HomeActionState extends HomeState {}

// Initial state when the HomeBloc is first created.
class HomeInitial extends HomeState {}

// State when the app is loading data (e.g., fetching products).
class HomeLoadingState extends HomeState {}

// State when the products are successfully loaded.
class HomeLoadedSuccessState extends HomeState {
  // List of products fetched from the data source.
  final List<ProductDataModel> products;

  // Constructor to initialize the state with a list of products.
  HomeLoadedSuccessState({required this.products});
}

// State representing an error, typically when the loading of products fails.
class HomeErrorState extends HomeState {}

// State for navigating to the Wishlist page.
class HomeNavigateToWishlistPageActionState extends HomeActionState {}

// State for navigating to the Cart page.
class HomeNavigateToCartPageActionState extends HomeActionState {}

// State when a product has been successfully added to the wishlist.
class HomeProductItemWishListedActionState extends HomeActionState {}

// State when a product has been successfully added to the cart.
class HomeProductItemsCartedActionState extends HomeActionState {}
