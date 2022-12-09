import 'package:bantu_rafi/features/cart/data/model/list_cart_res/cart.dart';
import 'package:bantu_rafi/features/cart/presentation/cart/blocs/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    /// Ini dipasang disini, agar ketika user ke page Cart Screen nanti dia akan get Data Lagi dari awal
    context.read<CartBloc>().add(OnStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                if (state is CartSuccess) {
                  return ListView.separated(
                    itemBuilder: (context, index) => CardProduct(
                      cart: state.listCart[index],
                      onTapAdd: () => context
                          .read<CartBloc>()
                          .add(AddCart(state.listCart[index])),
                      onTapCheck: (value) => context
                          .read<CartBloc>()
                          .add(ToogleCheckBox(state.listCart[index])),
                      onTapRemove: () => context
                          .read<CartBloc>()
                          .add(RemoveCart(state.listCart[index])),
                      onTapSubtract: () => context
                          .read<CartBloc>()
                          .add(SubtractCart(state.listCart[index])),
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                    itemCount: state.listCart.length,
                  );
                }
                if (state is CartLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is CartError) {
                  return const Center(child: Text('Error'));
                }
                return const SizedBox();
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            child: Column(
              children: [
                const Text(
                  'Total Harga',
                ),
                BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    if (state is CartSuccess) {
                      return Text(
                        state.totalPembayaran.toString(),
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CardProduct extends StatelessWidget {
  final Cart cart;
  final Function()? onTapRemove;
  final Function()? onTapAdd;
  final Function()? onTapSubtract;
  final Function(bool?)? onTapCheck;
  const CardProduct({
    Key? key,
    required this.cart,
    this.onTapRemove,
    this.onTapAdd,
    this.onTapSubtract,
    this.onTapCheck,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[100],
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Checkbox(
            value: cart.isChecked,
            onChanged: onTapCheck,
          ),
          Text(cart.name),
          const Spacer(),
          IconButton(
            onPressed: onTapRemove,
            icon: const Icon(
              Icons.delete,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          IconButton(
            onPressed: onTapAdd,
            icon: const Icon(
              Icons.add_circle_outline_outlined,
            ),
          ),
          Text('${cart.quantity}'),
          IconButton(
            onPressed: onTapSubtract,
            icon: const Icon(
              Icons.remove_circle_outline_outlined,
            ),
          ),
        ],
      ),
    );
  }
}
