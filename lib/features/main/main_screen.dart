import 'package:bookia/core/constants/app_assets.dart';
import 'package:bookia/core/constants/app_colors.dart';
import 'package:bookia/features/home/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var currentIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    const Center(child: Text('Home')),
    const Center(child: Text('Home')),
    const Center(child: Text('Home')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        backgroundColor: AppColors.whiteColor,
        // selectedItemColor: AppColors.Primary,
        // unselectedItemColor: AppColors.whiteColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (value) => setState(() => currentIndex = value),
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppAssets.homeSvg),
            label: 'Home',
            activeIcon: SvgPicture.asset(
              AppAssets.homeSvg,
              colorFilter: ColorFilter.mode(AppColors.Primary, BlendMode.srcIn),
            ),
          ),

          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppAssets.bookmarkSVG),
            label: 'Bookmark',
            activeIcon: SvgPicture.asset(
              AppAssets.bookmarkSVG,
              colorFilter: ColorFilter.mode(AppColors.Primary, BlendMode.srcIn),
            ),
          ),

          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppAssets.categorySvg),

            label: 'Cart',
            activeIcon: SvgPicture.asset(
              AppAssets.categorySvg,
              colorFilter: ColorFilter.mode(AppColors.Primary, BlendMode.srcIn),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppAssets.profileSvg),

            label: 'Profile',
            activeIcon: SvgPicture.asset(
              AppAssets.profileSvg,
              colorFilter: ColorFilter.mode(AppColors.Primary, BlendMode.srcIn),
            ),
          ),
        ],
      ),
    );
  }
}
