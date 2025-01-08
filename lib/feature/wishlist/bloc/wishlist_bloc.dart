import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:simple_grocery_app_using_bloc/data/wishlist_items.dart';
import 'package:simple_grocery_app_using_bloc/feature/home/models/home_product_data_model.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

// WishlistBloc handles all the business logic related to the wishlist functionality.
class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  // Constructor initializes with a WishlistInitial state.
  WishlistBloc() : super(WishlistInitial()) {
    // Event handlers for different actions.
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<WishlistRemoveFromWishlistEvent>(wishlistRemoveFromWishlistEvent);
  }

  // Event handler for initializing the wishlist.
  FutureOr<void> wishlistInitialEvent(
      WishlistInitialEvent event, Emitter<WishlistState> emit) {
    // Emit WishlistSuccessState with the current wishlist items.
    emit(WishlistSuccessState(wishlistItems: wishlistItems));
  }

  // Event handler for removing a product from the wishlist.
  FutureOr<void> wishlistRemoveFromWishlistEvent(
      WishlistRemoveFromWishlistEvent event, Emitter<WishlistState> emit) {
    // Remove the product from the wishlist data source.
    wishlistItems.remove(event.productDataModel);
    // Emit WishlistRemovedActionState to indicate an item was removed.
    emit(WishlistRemovedActionState());
    // Emit the updated wishlist state with the remaining items.
    emit(WishlistSuccessState(wishlistItems: wishlistItems));
  }
}
