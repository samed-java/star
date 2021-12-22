import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star/models/basket.dart';
import 'package:star/services/basket_service.dart';
import 'package:star/states/basket_state/basket_state.dart';
import 'package:star/view/basket/basket.dart';

class BasketCubit extends Cubit<BasketState> {
  late BasketModel basket;

  BasketCubit() : super(InitState());

  void setData(BasketModel basket) {
    try {
      this.basket = basket;
      emit(LoadingState(basket));
    } on Exception catch (e) {
      emit(ErrorState(e));
    }
  }

  void sendData() {
    try {
      BasketService.postData(this.basket.toJson());
      emit(LoadedState());
    } on Exception catch (e) {
      emit(ErrorState(e));
    }
  }
}