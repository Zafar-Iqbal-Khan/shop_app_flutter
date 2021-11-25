import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shop_app/controllers/product_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shop_app/views/product_tile.dart';
import 'package:shop_app/views/product_detail.dart';

class HomePage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('SHOP APP'),
      ),
      body: Obx(() => productController.isLoading.value
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.green,
              ),
            )
          : StaggeredGridView.countBuilder(
              crossAxisCount: 2,
              itemCount: productController.productList.length,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => Get.to(
                    ProductDetail(productController.productList[index]),
                  ),
                  child: ProductTile(productController.productList[index]),
                );
              },
              staggeredTileBuilder: (index) => StaggeredTile.fit(1),
            )),
    );
  }
}
