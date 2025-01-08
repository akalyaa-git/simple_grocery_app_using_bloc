import 'package:simple_grocery_app_using_bloc/feature/home/models/home_product_data_model.dart';

// A global list to store the items added to the wishlist.
// Each item in this list is an instance of ProductDataModel, representing a product's data structure.
// The wishlist serves as a collection of products that the user is interested in but hasn't added to the cart yet.
List<ProductDataModel> wishlistItems = [];