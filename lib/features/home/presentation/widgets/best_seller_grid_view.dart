import 'package:bookia/core/extensions/navigation.dart';
import 'package:bookia/features/home/data/model/best_seller_response/product.dart';
import 'package:flutter/material.dart';

class BestSellerGridView extends StatelessWidget {
  const BestSellerGridView({super.key, required this.products});
  final List<Product> products;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: products.length,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 4,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {

        if(products.isEmpty){
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(),

          );

        }
           return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              products[index].image ?? '',
              fit: BoxFit.cover,
              width: double.infinity),

          ); 
        // return GestureDetector(
        //   onTap: () {
        //     // context.pushTo(Route.bookDetails, extra: products[index]);
        //   },
        //   child: BestSellerGridViewItem(product: products[index]),
        // );
      },
    );
  }
}
