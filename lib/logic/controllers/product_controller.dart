import 'package:e_commerce_task1/models/product_models.dart';
import 'package:e_commerce_task1/services/product_services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductController extends GetxController {
  var productList = <ProductModels>[].obs;

  var favouritesList = <ProductModels>[].obs;

  var storage = GetStorage();

  // final GetStorage storage = GetStorage();

  var isLoading = true.obs;

  // var isFavourite = false.obs;

  @override
  void onInit() async {
    super.onInit();

    List? storedShoppings = storage.read<List>('isFavouritesList');

    if (storedShoppings != null) {
      favouritesList =
          storedShoppings.map((e) => ProductModels.fromJson(e)).toList().obs;
    }
    getProducts();
  }

  void getProducts() async {
    var products = await ProductServices.getProduct();
    try {
      isLoading(true);
      if (products.isNotEmpty) {
        productList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

  // void addFavourites() {
  //   isFavourites.value = !isFavourites.value;
  // }

  void manageFavourites(int productId) async {
    var existingIndex =
        favouritesList.indexWhere((element) => element.id == productId);

    if (existingIndex >= 0) {
      favouritesList.removeAt(existingIndex);

      await storage.remove('isFavouritesList');
    } else {
      favouritesList
          .add(productList.firstWhere((element) => element.id == productId));
      await storage.write('isFavouritesList', favouritesList);
    }
  }

  bool isFavourites(int productId) {
    return favouritesList.any((element) => element.id == productId);
  }
}
