import 'package:bookia/core/constants/app_constants.dart';
import 'package:bookia/core/services/dio_provider.dart';
import 'package:bookia/core/services/shared_pref.dart';
import 'package:bookia/features/wishlist/data/model/wish_list_response/wish_list_response.dart';
import 'package:bookia/features/wishlist/presentation/cubit/wish_list_state.dart';

class WishListRepo {
  static Future<WishListResponse?> getWishList() async {
    try {
      var response = await DioProvider.get(
        endPoint: AppConstants.wishList,
        headers: {'Authorization': 'Bearer ${SharedPref.getUserToken()}'},
      );
      if (response.statusCode == 200) {
        return WishListResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (_) {
      return null;
    }
  }

  static Future<WishListResponse?> addToWishList(int productId) async {
    try {
      var response = await DioProvider.post(
        endPoint: AppConstants.addToWishList,
        data: {'product_id': productId},
        headers: {'Authorization': 'Bearer ${SharedPref.getUserToken()}'},
      );
      if (response.statusCode == 200) {
        return WishListResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (_) {
      return null;
    }
  }

  static Future<WishListResponse?> removeFromWishList(int productId) async {
    try {
      var response = await DioProvider.post(
        endPoint: AppConstants.removeFromWishList,
        data: {'product_id': productId},
        headers: {'Authorization': 'Bearer ${SharedPref.getUserToken()}'},
      );
      if (response.statusCode == 200) {
        return WishListResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (_) {
      return null;
    }
  }

  static Future<WishListResponse?> addToCart(int productId) async {
    try {
      var response = await DioProvider.post(
        endPoint: AppConstants.addToCart,
        data: {'product_id': productId},
        headers: {'Authorization': 'Bearer ${SharedPref.getUserToken()}'},
      );
      if (response.statusCode == 200) {
        return WishListResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (_) {
      return null;
    }
  }
}
