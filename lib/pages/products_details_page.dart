import 'package:enduee/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Productsdetails extends StatefulWidget {
  final Map<String, Object> product;

  const Productsdetails({
    super.key,
    required this.product,
  });

  @override
  State<Productsdetails> createState() => _ProductsdetailsState();
}

class _ProductsdetailsState extends State<Productsdetails> {
  String selectsize = '';

  void onTap() {
    if (selectsize != '') {
      Provider.of<Cartprovider>(context, listen: false).addProduct({
        'id': widget.product['id'],
        'title': widget.product['title'],
        'price': widget.product['price'],
        'imageurl': widget.product['imageurl'],
        'sizes': selectsize,
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Product added succesfully!'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a size!!'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body:
      Column(
        children: [
          Center(
              child: Text(
            widget.product['title'] as String,
            style: Theme.of(context).textTheme.titleLarge,
          )),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              widget.product['imageurl'] as String,
              height: 280,
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          Container(
            height: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.blue.shade50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '\৳${widget.product['price']}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          (widget.product['sizes'] as List<String>).length,
                      itemBuilder: (context, index) {
                        final size =
                            (widget.product['sizes'] as List<String>)[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectsize = size;
                              });
                            },
                            child: Chip(
                                backgroundColor: selectsize == size
                                    ? Theme.of(context).colorScheme.primary
                                    : null,
                                label: Text(size.toString())),
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: onTap,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade300,
                      fixedSize: const Size(360, 50),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_shopping_cart,
                          color: Colors.black,
                        ),
                        Text(
                          'Add To Cart',
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
