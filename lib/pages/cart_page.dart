import 'package:enduee/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cartpage extends StatelessWidget {
  const Cartpage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Cartprovider>().cart;
    //  final cart = Provider.of<Cartprovider>(context).cart;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
        ),
        body: ListView.builder(
            itemCount: cart.length,
            itemBuilder: (context, index) {
              final cartiteam = cart[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(cartiteam['imageurl'] as String),
                  radius: 40,
                ),
                trailing: IconButton(
                  onPressed: () {
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              'Delete Product',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            content: const Text(
                                'Are you sure you want to remove your product from your cart?'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'No',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue),
                                  )),
                              TextButton(
                                onPressed: () {
                                  context
                                      .read<Cartprovider>()
                                      .removeProduct(cartiteam);
                                  // Provider.of<Cartprovider>(context, listen: false).removeProduct(cartiteam);
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Yes',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red)),
                              ),
                            ],
                          );
                        });
                  },
                  icon: const Icon(Icons.delete),
                  color: Colors.red,
                ),
                title: Text(
                  cartiteam['title'].toString(),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                subtitle: Text('Size : ${cartiteam['sizes']}'),
              );
            }));
  }
}
