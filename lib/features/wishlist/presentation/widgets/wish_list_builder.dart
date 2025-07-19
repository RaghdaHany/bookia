import 'package:bookia/core/constants/app_colors.dart';
import 'package:bookia/features/home/data/model/best_seller_response/product.dart';
import 'package:bookia/features/wishlist/presentation/widgets/wish_list_item.dart';
import 'package:flutter/material.dart';

class WishListBuilder extends StatelessWidget {
  const WishListBuilder({
    super.key,
    required this.books,
    required this.onRemove,
    required this.onAddToCart,
  });

  final List<Product> books;
  final Function(int) onRemove;
  final Function(int) onAddToCart;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(20),
      itemCount: books.length,
      itemBuilder: (context, index) {
        var book = books[index];
        return Hero(
          tag: index,
          child: WishListItem(
            product: book,
            onRemove: onRemove,
            onAddToCart: onAddToCart,
          ),
        );
      },
      separatorBuilder:
          (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: const Divider(color: AppColors.borderColor),
          ),
    );
  }
}
