import 'package:fe_store/cubit/product/product_cubit.dart';
import 'package:fe_store/screens/widgets/detail_card.dart';
import 'package:flutter/material.dart';

import 'package:fe_store/config/theme_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isShow = false;

  @override
  Widget build(BuildContext context) {
    double witdhContainer = MediaQuery.of(context).size.width;
    final watchState = context.watch<ProductCubit>();
    bool isLoading = watchState.state is ProductLoading;

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
            flexibleSpace: Text(
              'Selamat Datang',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Find some item ??",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton.icon(
                        onPressed: (isLoading)
                            ? null
                            : () {
                                context.read<ProductCubit>().getAllProduct();
                              },
                        icon: const Icon(Icons.search),
                        label: Text(
                          'Search Some Item',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(witdhContainer * 0.7, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          backgroundColor: (isLoading)
                              ? raisinBlackColor.withOpacity(0.4)
                              : raisinBlackColor,
                        ),
                      ),
                      Material(
                        type: MaterialType.transparency,
                        child: Ink(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black54, width: 3),
                              borderRadius: BorderRadius.circular(10)),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(100),
                            onTap: () {
                              setState(() {
                                isShow = !isShow;
                              });
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(8),
                              child: Icon(
                                Icons.filter_alt_outlined,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Visibility(
                    visible: isShow,
                    child: FilterWidget(witdhContainer: witdhContainer),
                  ),
                ],
              ),
            ),
          ),
          BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              if (state is ProductSuccess) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return DetailCard(
                        witdhContainer: witdhContainer,
                        productModel: state.productModel![index],
                      );
                    },
                    childCount: state.productModel!.length,
                  ),
                );
              }

              if (state is ProductLoading) {
                return const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 75),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    ),
                  ),
                );
              }

              if (state is ProductEror) {
                return SliverToBoxAdapter(
                  child: Center(
                    child: Text("Cannot get data: ${state.erorText}"),
                  ),
                );
              }

              return SliverToBoxAdapter(child: Container());
            },
          ),
        ],
      ),
    );
  }
}

class FilterWidget extends StatefulWidget {
  final double witdhContainer;
  const FilterWidget({
    Key? key,
    required this.witdhContainer,
  }) : super(key: key);

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  String categoryValue = 'electronics';
  List<String> categoryList = [
    "electronics",
    "jewelery",
    "men's clothing",
    "women's clothing"
  ];

  String limitValue = '1';
  List<String> limitList = ['1', '2', '3', '4', '5'];

  @override
  Widget build(BuildContext context) {
    final watchState = context.watch<ProductCubit>();
    bool isLoading = watchState.state is ProductLoading;
    return Container(
      width: widget.witdhContainer,
      height: 120,
      margin: const EdgeInsets.symmetric(vertical: 18),
      padding: const EdgeInsets.only(top: 4),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  'Category',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
              Container(
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: Colors.black)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    padding: const EdgeInsets.only(left: 5),
                    value: (isLoading) ? null : categoryValue,
                    disabledHint: const Text(
                      "Loading..",
                      style: TextStyle(fontSize: 14),
                    ),
                    items: categoryList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(fontSize: 14),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        categoryValue = newValue!;
                      });
                      context
                          .read<ProductCubit>()
                          .getProductByCategory(categoryValue, limitValue);
                    },
                  ),
                ),
              ),
            ],
          ),
          //Limit
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  'Limit',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
              Container(
                width: 90,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: Colors.black)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    padding: const EdgeInsets.only(left: 5),
                    value: (isLoading) ? null : limitValue,
                    disabledHint: const Text(
                      "Loading..",
                      style: TextStyle(fontSize: 14),
                    ),
                    items:
                        limitList.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(fontSize: 14),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        limitValue = newValue!;
                      });
                      context
                          .read<ProductCubit>()
                          .getProductByCategory(categoryValue, limitValue);
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
