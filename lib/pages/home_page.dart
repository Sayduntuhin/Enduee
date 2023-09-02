import 'package:enduee/pages/cart_page.dart';
import 'package:enduee/pages/product_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Homepage();
  }
}

class _Homepage extends State<Homepage> {
  int currentpage = 0;
  List<Widget> pages = [ProductList(), Cartpage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: //currentpage == 0 ? ProductList() : Cartpage() ,
          //pages[currentpage],

          IndexedStack(
        index: currentpage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          iconSize: 35,
          onTap: (value) {
            setState(() {
              currentpage = value;
            });
          },
          currentIndex: currentpage,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_shopping_cart,
                ),
                label: 'Add to Cart')
          ]),
    );
  }
}
