import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/core/constants/app_assets.dart';
import 'package:bookia/core/constants/app_colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/features/home/data/model/best_seller_response/product.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class WishListItem extends StatelessWidget {
  const WishListItem({
    super.key,
    required this.product,
    required this.onRemove,
    required this.onAddToCart,
  });

  final Product product;
  final Function(int value) onRemove;
  final Function(int value) onAddToCart;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(
            imageUrl: product.image ?? '',
            width: 100,
            height: 118,
            fit: BoxFit.cover,
          ),
        ),
        const Gap(20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      product.name ?? '',
                      style: TextStyles.getTitle(color: AppColors.borderColor),
                      maxLines: 2,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => onRemove(product.id ?? 0),
                    child: SvgPicture.asset(
                      AppAssets.closeSvg,
                      colorFilter: ColorFilter.mode(
                        AppColors.borderColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ],
              ),
              Gap(9),
              Text('\$${product.price}', style: TextStyles.getBody()),
              Gap(16),
              MainButton(
                height: 40,
                onPressed: () => onAddToCart(product.id ?? 0),
                text: 'Add to Cart',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
