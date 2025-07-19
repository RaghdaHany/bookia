
import 'package:bookia/features/cart/data/model/cart_response/cart_response.dart';
import 'package:bookia/features/cart/data/repo/cart_repo.dart';
import 'package:bookia/features/cart/presentation/cubit/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  CartResponse? cartResponse;
  Future<void> getCart() async {
    try {
      emit(CartLoading());
      var response = await CartRepo.getCart();
            if (response != null) {
              cartResponse = response;
              emit(CartSuccess());
            }else{
emit(CartFailureState());
            }
      
    } catch (e) {
emit(CartFailureState());
    }
  }

  Future addToCart({required int productId}) async {
    try {
      var response = await CartRepo.addToCart(productId:  productId);
      if(response){
        emit(CartSuccess());
      }else{
        emit (CartFailureState());
      }
    } on Exception catch (_) {
        emit (CartFailureState());
    }
  }

  Future<void> removeFromCart({required int cartItemId}) async {
   try {
      var response = await CartRepo.removeFromCart(cartItemId: cartItemId);
      if(response){
        emit(CartSuccess());
      }else{
        emit (CartFailureState());
      }
    } on Exception catch (_) {
        emit (CartFailureState());
    }
  }

  Future<void> updateCart(
      {required int cartItemId, required int quantity}) async {
    try {
      var response = await CartRepo.updateCartItemQuantity(cartItemId: cartItemId, quantity: quantity);
          
                if (response != null) {
                  cartResponse = response;
                  emit(CartSuccess());
                }
              
    } on Exception catch (_) {
      emit(CartFailureState());
    }

    }
    

}