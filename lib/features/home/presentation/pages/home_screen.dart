import 'package:bookia/core/constants/app_assets.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/features/home/data/model/best_seller_response/product.dart';
import 'package:bookia/features/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/features/home/presentation/cubit/home_state.dart';
import 'package:bookia/features/home/presentation/widgets/best_seller_grid_view.dart';
import 'package:bookia/features/home/presentation/widgets/empty_home_ui.dart';
import 'package:bookia/features/home/presentation/widgets/home_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getHomeData(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: SvgPicture.asset(AppAssets.logoSvg, width: 100),
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(AppAssets.searchSvg),
            ),
          ],
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            var cubit = context.read<HomeCubit>();
            if (state is HomeFailureState) {
              return Center(child: Text('Something Went Wrong'));
            } else if (state is HomeSuccessState) {
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: HomeSlider(sliders: cubit.sliders),
                    ),
                    Gap(15),
                    BestSellersSection(products: cubit.bestSellersList),
                    Gap(32),
                  ],
                ),
              );
            } else {
              return EmptyHomeUi();
            }
          },
        ),
      ),
    );
  }
}

class BestSellersSection extends StatelessWidget {
  const BestSellersSection({super.key, required this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Text('Best Sellers', style: TextStyles.getHeadLine2()),
        ),
        Padding(
          padding: const EdgeInsets.all(18),
          child: BestSellerGridView(products: products),
        ),
      ],
    );
  }
}
