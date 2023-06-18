import 'package:flutter/material.dart';

import 'package:fe_store/data/models/product_model.dart';

class DetailProductPage extends StatelessWidget {
  const DetailProductPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map arg = ModalRoute.of(context)?.settings.arguments as Map;

    ProductModel productModel = arg["detailProduct"];
    return Scaffold(
        body: SafeArea(
            child: ListView(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Image.network(
                productModel.image,
                fit: BoxFit.cover,
              ),
              Positioned(
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_back_outlined)))
            ],
          ),
        )
      ],
    )));
  }
}
