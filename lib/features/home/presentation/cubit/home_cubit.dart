import 'package:bookia/features/home/data/model/best_seller_response/best_seller_response.dart';
import 'package:bookia/features/home/data/model/best_seller_response/product.dart';
import 'package:bookia/features/home/data/repo/home_repo.dart';
import 'package:bookia/features/home/data/model/slider_response/slider_response.dart';
import 'package:bookia/features/home/data/model/slider_response/slider_model.dart';
import 'package:bookia/features/home/presentation/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  List<SliderModel> sliders = [];
  List<Product> bestSellersList = [];
  List<Product> allproducts = [];


// calling 2 apis in parallel
  void getHomeData() async {
    emit(HomeLoadingState());
    try {
      var futures = await Future.value([
        HomeRepo().getSliders(),
        HomeRepo().getBestSeller(),
        // HomeRepo.getAllProducts()
      ]);
      
        sliders = ((await futures[0]) as SliderResponse).data?.sliders ?? []; 
        bestSellersList = ((await futures[1]) as BestSellerResponse).data?.products ?? [];

        emit(HomeSuccessState());
     
    } on Exception catch (_) {
      emit(HomeFailureState());
    }
  }
}
