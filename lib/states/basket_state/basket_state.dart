import 'package:star/models/basket.dart';
import 'package:star/view/basket/basket.dart';

abstract class BasketState{
  BasketState();
}

class InitState extends BasketState{
  InitState();
}

class LoadingState extends BasketState{
  late BasketModel basket;
  LoadingState(this.basket);
}

class LoadedState extends BasketState{
  LoadedState();
}

class ErrorState extends BasketState{
  late Exception e;
  ErrorState(this.e);
}