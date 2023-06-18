import 'package:fe_store/bottom_nav.dart';
import 'package:fe_store/screens/account_page.dart';
import 'package:fe_store/screens/cart_page.dart';
import 'package:fe_store/screens/detail_product_page.dart';
import 'package:fe_store/screens/home_page.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  "/": (p0) => const BottomNavWidget(),
  "/homePage": (p0) => const HomePage(),
  "/cartPage": (p0) => const CartPage(),
  "/accountPage": (p0) => const AccountPage(),
  "/detailPage": (p0) => DetailProductPage(),
};
