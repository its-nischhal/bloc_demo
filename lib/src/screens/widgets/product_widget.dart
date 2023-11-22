import 'package:bloc_demo/src/model/home_screen_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(product.name.name),
      title: Text(product.stock.rate.toString()),
      subtitle: Text(product.stock.receivedQty.toString()),
      trailing: Text(product.stock.tankLevel.sign.toString()),
    );
  }
}
