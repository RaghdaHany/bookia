import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/components/dialogs/loading_dialog.dart';
import 'package:bookia/core/constants/app_assets.dart';
import 'package:bookia/core/constants/app_colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/features/home/data/model/best_seller_response/product.dart';
import 'package:bookia/features/wishlist/presentation/cubit/wish_list_cubit.dart';
import 'package:bookia/features/wishlist/presentation/cubit/wish_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WishListCubit()..getWishListData(),
      child: BlocConsumer<WishListCubit, WishListState>(
        listener: (context, state) {
          if (state is WishListErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text('Something Went Wrong'),
              ),
            );
          }
        },
        builder: (context, state) {
          var cubit = context.read<WishListCubit>();
          int bookAddedId =
              cubit.wishListResponse.data?.data
                  ?.where((element) => element.id == product.id)
                  .firstOrNull
                  ?.id ??
              0;

          return Scaffold(
            appBar: AppBar(
              title: BackButton(
                onPressed: () {
                  context.pop();
                },
              ),
              actions: [
                GestureDetector(
                  onTap: () async {
                    showLoadingDialog(context);
                    if (bookAddedId != product.id) {
                      await cubit.addToWishList(product.id ?? 0).then((_) {
                        SnackBar(content: Text('Book Added Successfully'));
                      });
                    } else if (bookAddedId == product.id) {
                      await cubit.removeFromWishList(product.id ?? 0).then((_) {
                        SnackBar(content: Text('Book Removed Successfully'));
                      });
                    }
                    await cubit.getWishListData();
                    context.pop();
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: SvgPicture.asset(
                      AppAssets.bookmarkSVG,
                      colorFilter: ColorFilter.mode(
                        product.id == bookAddedId
                            ? AppColors.Primary
                            : AppColors.darkColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ],
              automaticallyImplyLeading: false,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        product.image ?? '',
                        fit: BoxFit.cover,
                        width: 200,
                      ),
                    ),

                    Gap(15),
                    Text(
                      product.name ?? '',
                      style: TextStyles.getHeadLine1(),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      product.category ?? '',
                      style: TextStyles.getBody(color: AppColors.Primary),
                    ),
                    Gap(15),
                    Text(
                      product.description ?? '',
                      style: TextStyles.getSmall(
                        color: AppColors.darkColor,
                      ).copyWith(height: 2),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 20,
                ),
                child: Row(
                  children: [
                    Text(
                      '\$ ${product.price} ',
                      style: TextStyles.getHeadLine2(),
                    ),
                    Gap(30),
                    Expanded(
                      child: MainButton(
                        bgColor: AppColors.darkColor,
                        text: 'Add to Cart',

                        onPressed: () async {
                          showLoadingDialog(context);
                          await cubit.addToCart(product.id ?? 0).then((_) {
                            SnackBar(content: Text('Cart Update Successfully'));
                          });
                          context.pop();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
