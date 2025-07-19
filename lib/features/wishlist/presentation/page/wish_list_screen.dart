import 'package:bookia/components/dialogs/loading_dialog.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/features/wishlist/presentation/cubit/wish_list_cubit.dart';
import 'package:bookia/features/wishlist/presentation/cubit/wish_list_state.dart';
import 'package:bookia/features/wishlist/presentation/widgets/wish_list_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WishListCubit()..getWishListData(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('WishList', style: TextStyles.getHeadLine2()),
          centerTitle: true,
        ),
        body: BlocBuilder<WishListCubit, WishListState>(
          builder: (context, state) {
            var cubit = context.read<WishListCubit>();
            var books = cubit.wishListResponse.data?.data ?? [];
            if (state is WishListSuccessState) {
              if (books.isEmpty) {
                return Container();
              }
              return WishListBuilder(
                onAddToCart: (bookId) async {
                  showLoadingDialog(context);
                  await cubit.addToCart(bookId);
                  context.pop();
                  SnackBar(
                      content: Text('Cart Update Successfully')
                    );
                },
                books: books,
                onRemove: (bookId) async {
                  showLoadingDialog(context);
                  await cubit.removeFromWishList( bookId);
                  context.pop();
                },
              );
            } else if (state is WishListErrorState) {
              return showErrorDialog(context, 'Wrong');
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}