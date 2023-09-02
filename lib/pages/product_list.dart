import 'package:enduee/widgets/products_card.dart';
import 'package:enduee/pages/products_details_page.dart';
import 'package:flutter/material.dart';

import '../global_variable.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Productlist();
  }
}

class _Productlist extends State<ProductList> {
  final List<String> filters = const [
    'All',
    'Shirts',
    'T-shirts',
    'Pants',
    'Jeans',
    'Panjabis',
  ];
  late String selectfilters;
  @override
  void initState() {
    super.initState();
    selectfilters = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Enduee\nCloths Brand',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                        ),
                        hintText: 'Search',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(21),
                              bottomLeft: Radius.circular(21)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(21),
                              bottomLeft: Radius.circular(21)),
                        )),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                  itemCount: filters.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final filter = filters[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectfilters = filter;
                          });
                        },
                        child: Chip(
                          backgroundColor: selectfilters == filter
                              ? Theme.of(context).colorScheme.primary
                              : Colors.grey.shade300,
                          label: Text(filter),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 17),
                          side: const BorderSide(color: Colors.black26),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                    );
                  }),
            ),
            Expanded(
              child: LayoutBuilder(builder: (context,constraints)
              {


                if(constraints.maxWidth > 1085)
                  {
                 return GridView.builder(
                  itemCount: products.length,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1.75),
                  itemBuilder: (context, index) {
                  final product = products[index];
                  return GestureDetector(
                  onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                  return Productsdetails(product: product);
                  }));
                  },
                  child: Productscard(
                  title: product['title'] as String,
                  price: product['price'] as double,
                  image: product['imageurl'] as String,
                  bgcolour: index.isEven
                  ? Colors.blue.shade50
                      : Colors.grey.shade200,
                  ),
                  );
                  });}
                else {
                  return  ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return Productsdetails(product: product);
                            }));
                          },
                          child: Productscard(
                            title: product['title'] as String,
                            price: product['price'] as double,
                            image: product['imageurl'] as String,
                            bgcolour: index.isEven
                                ? Colors.blue.shade50
                                : Colors.grey.shade200,
                          ),
                        );
                      });

                }




              }),
            ),


          ],
        ),
      ),
    );
  }
}
