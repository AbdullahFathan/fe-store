import 'package:fe_store/config/theme_data.dart';
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
        //{ Product Image}
        Container(
          width: MediaQuery.of(context).size.width * 0.45,
          height: MediaQuery.of(context).size.height * 0.45,
          padding: const EdgeInsets.only(bottom: 18),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25))),
          child: Stack(
            children: [
              Center(
                child: Image.network(
                  productModel.image,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_outlined),
                ),
              )
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productModel.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 10,
              ),

              //{Price, rate, sold out count}
              Row(
                children: [
                  Text(
                    '${productModel.price}',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 20),
                  ),
                  const SizedBox(
                    width: 35,
                  ),
                  Text(
                    "${productModel.rating.rate}",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow[400],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    "${productModel.rating.count} sold out",
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              ),
              //{Product Description}
              Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 15),
                child: Text(
                  "Description",
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: Colors.black),
                ),
              ),

              Text(
                productModel.description,
                style: const TextStyle(fontSize: 14),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 35, bottom: 10),
                child: Row(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.add_shopping_cart_outlined),
                      label: Text(
                        'Add to Cart',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(170, 45),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        backgroundColor: raisinBlackColor,
                      ),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.remove_circle_outline_outlined),
                      label: Text(
                        'Remove Item',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(170, 45),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        backgroundColor: raisinBlackColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    )));
  }
}
