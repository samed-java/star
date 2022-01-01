import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star/models/basket.dart';
import 'package:star/services/basket_service.dart';
import 'package:star/states/basket_state/basket_state.dart';
import 'package:star/view/basket/basket.dart';

class BasketCubit extends Cubit<BasketState> {
  late BasketModel basket;

  BasketCubit() : super(BInitState());

  void setData(BasketModel basket) {
    try {
      this.basket = basket;
      emit(BLoadingState(basket));
    } on Exception catch (e) {
      emit(BErrorState(e));
    }
  }

  void sendData(Map<String,dynamic> data) {
    try {
      print(data);
      BasketService.postData(data);
      emit(BLoadedState());
      emit(BInitState());
    } on Exception catch (e) {
      emit(BErrorState(e));
    }
  }
}