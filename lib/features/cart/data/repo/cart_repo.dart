import 'dart:developer';

import 'package:bookia/core/constants/app_constants.dart';
import 'package:bookia/core/services/shared_pref.dart';
import 'package:bookia/features/cart/data/model/cart_response/cart_response.dart';
import 'package:bookia/core/services/dio_provider.dart';

class CartRepo {
  static Future<CartResponse?> getCart() async {
    try {
      var response = await DioProvider.get(
          endPoint: AppConstants.cart,
          headers: {
            "Authorization":
                "Bearer ${SharedPref.getUserToken()}"
          });

          
      if (response.statusCode == 200) {
        return CartResponse.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<bool> addToCart({required int productId}) async {
    try {
      var response = await DioProvider.post(
          endPoint: AppConstants.addToCart,
          data: {
            "product_id": productId
          },
          headers: {
            "Authorization":
                "Bearer ${SharedPref.getUserToken()}"
          });
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<bool> removeFromCart({required int cartItemId}) async {
    try {
      var response = await DioProvider.post(
          endPoint: AppConstants.removeFromCart,
          data: {
            "cart_item_id": cartItemId
          },
          headers: {
            "Authorization":
                "Bearer ${SharedPref.getUserToken()}"
          });
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<CartResponse?> updateCartItemQuantity(
      {required int cartItemId, required int quantity}) async {
    try {
      var response = await DioProvider.post(
          endPoint: AppConstants.updateCart,
          data: {
            "cart_item_id": cartItemId,
            "quantity": quantity
          },
          headers: {
            "Authorization":
                "Bearer ${SharedPref.getUserToken()}"
          });
      if (response.statusCode == 201) {
        return CartResponse.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  // static Future<bool> checkout() async {
  //   try {
  //     var response = await DioProvider.get(
  //         endPoint: AppConstants.checkout,
  //         headers: {
  //           "Authorization":
  //               "Bearer ${SharedPref.getUserToken()}"
  //         });
  //     if (response.statusCode == 200) {
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //     return false;
  //   }
  // }
}