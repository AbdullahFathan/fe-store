import 'package:fe_store/data/models/product_model.dart';
import 'package:fe_store/screens/widgets/detail_card.dart';
import 'package:flutter/material.dart';

import 'package:fe_store/config/theme_data.dart';

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
                        onPressed: () {},
                        icon: const Icon(Icons.search),
                        label: Text(
                          'Search Some Item',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(witdhContainer * 0.7, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          backgroundColor: raisinBlackColor,
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
        ],
      ),
    );
  }
}

/*
Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
            ],
          ),
          // {To show flitter product}
          

          // {Show some product from api}
          SizedBox(
            height: 500,
            width: witdhContainer,
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
                return DetailCard(
                  witdhContainer: witdhContainer,
                  productModel: dummyData,
                );
              },
            ),
          ),
        ],
      ),
 */

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
  String dropdownValue = 'All';
  List<String> categoryList = [
    'All',
    'Electronics',
    'Jewelery',
    'Men`s clothing',
    'Women`s clothing'
  ];

  String limitValue = '1';
  List<String> limitList = ['1', '2', '3', '4', '5'];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Container(
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
                      value: dropdownValue,
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
                          dropdownValue = newValue!;
                        });
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
                      value: limitValue,
                      items: limitList
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
                          limitValue = newValue!;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
