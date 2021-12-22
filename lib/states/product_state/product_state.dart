import 'package:star/models/product.dart';

abstract class ProductState{
  ProductState();
}

class PInitState extends ProductState{
  PInitState();
}

class PLoadingState extends ProductState{

  PLoadingState();
}

class PLoadedState extends ProductState{
  late Future<List<Product>> product;
  PLoadedState(this.product);
}

class PErrorState extends ProductState{
  late Exception e;

  PErrorState(this.e);
}