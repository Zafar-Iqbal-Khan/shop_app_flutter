import 'package:get/get.dart';
import 'package:shop_app/models/model.dart';
import 'package:shop_app/services/services.dart';

class ProductController extends GetxController {
  var productList = List<Welcome>().obs;
  var isLoading = true.obs;
  

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await Services.fetchProducts();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
