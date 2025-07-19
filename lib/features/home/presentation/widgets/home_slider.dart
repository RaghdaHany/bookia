import 'package:bookia/core/constants/app_colors.dart';
import 'package:bookia/features/home/data/model/slider_response/slider_model.dart';
import 'package:bookia/features/home/presentation/widgets/empty_home_ui.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key, required this.sliders});
  final List<SliderModel> sliders;
  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        (widget.sliders.isEmpty) ? EmptyHomeUi() : Gap(20),
        CarouselSlider.builder(
          itemCount: widget.sliders.length,
          itemBuilder: (context, int itemIndex, int pageViewIndex) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                widget.sliders[itemIndex].image ?? '',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            );
          },
          options: CarouselOptions(
            height: 150,
            // aspectRatio: 16 / 9,

            //how much it takes from screen width
            viewportFraction: 0.9,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            //make selected image bigger
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            onPageChanged: (index, reason) {
              setState(() {
                activeIndex = index;
              });
            },
            scrollDirection: Axis.horizontal,
          ),
        ),
        Gap(14),
        SmoothPageIndicator(
          controller: PageController(initialPage: activeIndex),
          count: widget.sliders.length,
          effect: ExpandingDotsEffect(
            dotHeight: 7,
            dotWidth: 7,
            spacing: 4,
            expansionFactor: 6,
            activeDotColor: AppColors.Primary,
            dotColor: AppColors.borderColor,
          ),
          onDotClicked: (index) {},
        ),
      ],
    );
  }
}
