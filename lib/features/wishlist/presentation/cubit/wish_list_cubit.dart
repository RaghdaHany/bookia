import 'package:bookia/features/wishlist/data/model/wish_list_response/wish_list_response.dart';
import 'package:bookia/features/wishlist/data/repo/wish_list_repo.dart';
import 'package:bookia/features/wishlist/presentation/cubit/wish_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishListCubit extends Cubit<WishListState> {
  WishListCubit() : super(WishListInitialState());

  WishListResponse wishListResponse = WishListResponse();
  WishListResponse addToWishListResponse = WishListResponse();


  Future getWishListData() async {
    emit(WishListLoadingState());
    try {
      var response = await WishListRepo.getWishList();
      if(response != null){
      emit(WishListSuccessState());

      }else{
              emit(WishListErrorState());

      }
      
    } on Exception catch (_) {
      emit(WishListErrorState());
    }
  }

  Future addToWishList(int productId) async {
    try {
      var response = await WishListRepo.addToWishList(productId);
      if(response != null){
        addToWishListResponse = response;
        emit(WishListSuccessState());
      }else{
        emit (WishListErrorState());
      }
    } on Exception catch (_) {
        emit (WishListErrorState());
    }
  }

  Future<void> removeFromWishList(int productId) async {
    try {
      var response = await WishListRepo.removeFromWishList(productId);
      if(response != null){
        emit(WishListSuccessState());
      }else{
        emit (WishListErrorState());
      }
    } on Exception catch (_) {
        emit (WishListErrorState());
    }
  }


    Future addToCart(int productId) async {
    try {
      var response = await WishListRepo.addToCart(productId);
      if(response != null ){
        emit(WishListSuccessState());
      }else{
        emit (WishListSuccessState());
      }
    } on Exception catch (_) {
        emit (WishListSuccessState());
    }
  }
}