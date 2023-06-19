import 'package:fe_store/config/routes.dart';
import 'package:fe_store/config/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/product/product_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductCubit>(
          create: (context) => ProductCubit(),
        ),
      ],
      child: MaterialApp(
        theme: themeData,
        title: "Fe-Store",
        routes: routes,
        initialRoute: "/",
      ),
    );
  }
}
