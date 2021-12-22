import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star/models/product.dart';
import 'package:star/services/product_service.dart';
import 'package:star/states/product_state/product_state.dart';

class ProductCubit extends Cubit<ProductState>{

  ProductCubit():super(PInitState());

  void getData(){
    try{
      emit(PLoadingState());
      Future<List<Product>> products = ProductService.getData() as Future<List<Product>>;
      emit(PLoadedState(products));
    }on Exception catch(e){
      emit(PErrorState(e));
    }
  }
}