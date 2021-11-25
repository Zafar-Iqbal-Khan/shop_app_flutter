import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/models/model.dart';

class ProductDetail extends StatelessWidget {
  final Welcome products;
  ProductDetail(this.products);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(products.title),
      ),
      body: ListView(
        children: [
          Container(
              padding: EdgeInsets.all(20),
              child: Card(
                elevation: 2.0,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          height: 300,
                          width: double.infinity,
                          child: Image.network(
                            products.image,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Obx(
                            () => CircleAvatar(
                              backgroundColor: Colors.white,
                              child: IconButton(
                                icon: products.isFavourite.value
                                    ? Icon(
                                        Icons.favorite_rounded,
                                      )
                                    : Icon(
                                        Icons.favorite_border,
                                      ),
                                onPressed: () {
                                  products.isFavourite.toggle();
                                },
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Description: ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                            TextSpan(
                              text: products.description,
                              style: TextStyle(fontSize: 23),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
