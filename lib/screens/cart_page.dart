import 'package:fe_store/cubit/cart/cart_cubit.dart';
import 'package:fe_store/screens/widgets/detail_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    context.read<CartCubit>().getCartList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double witdhContainer = MediaQuery.of(context).size.width;

    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartSuccess) {
          context.read<CartCubit>().getCartList();
        }
      },
      builder: (context, state) {
        if (state is CartGetList) {
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
                        productModel: state.productModel[index],
                      );
                    },
                    childCount: state.productModel.length,
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
                        Text(
                          '${state.totalPrice}',
                          style: Theme.of(context).textTheme.bodyLarge,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        if (state is CartLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
        }

        return Container();
      },
    );
  }
}
