import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Productscard extends StatelessWidget {
  //final String size;
  final Color bgcolour;
  final String image;
  final double price;
  final String title;


  const Productscard({super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.bgcolour,
    //required this.size,


  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: bgcolour
      ),

      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(16),

      child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,style: Theme.of(context).textTheme.titleMedium,),
          const SizedBox(height: 5,),
          Text('\৳$price',style: Theme.of(context).textTheme.bodySmall,),
          const SizedBox(height: 5,),
         // Text(size),
          Center(child: Image.asset(image , height: 180,))



        ],

      ),
    );
  }
}
