import 'package:fe_store/screens/widgets/detail_card.dart';
import 'package:flutter/material.dart';

import '../data/models/product_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double witdhContainer = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            flexibleSpace: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Text(
                      'Your Cart',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return DetailCard(
                  witdhContainer: witdhContainer,
                  productModel: dummyData, // Replace with your actual data
                );
              },
              childCount:
                  6, // Replace with the actual number of items in your cart
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              padding: const EdgeInsets.all(16.0),
              color: Colors.grey[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total Price:',
                      style: Theme.of(context).textTheme.bodyLarge),
                  Text('\$100', // Replace with your dynamic total price
                      style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
