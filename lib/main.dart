import 'package:bantu_rafi/features/cart/presentation/cart/blocs/cart/cart_bloc.dart';
import 'package:bantu_rafi/features/cart/presentation/cart/screen/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartBloc(),
      child: const MaterialApp(
        title: 'Flutter Demo',
        home: CartScreen(),
      ),
    );
  }
}
