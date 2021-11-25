import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/controllers/product_controller.dart';
import 'package:shop_app/models/model.dart';
import 'package:shop_app/views/product_detail.dart';

class ProductTile extends StatelessWidget {
  final Welcome product;
  ProductTile(this.product);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Padding(
        padding: EdgeInsets.all(9),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Image.network(
                product.image,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              product.title,
              maxLines: 2,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            if (product.rating != null)
              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      product.rating.rate.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            SizedBox(
              height: 10,
            ),
            Text(
              '\$${product.price}',
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
