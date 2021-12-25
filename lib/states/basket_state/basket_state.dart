import 'package:star/models/basket.dart';
import 'package:star/view/basket/basket.dart';

abstract class BasketState{
  BasketState();
}

class BInitState extends BasketState{
  BInitState();
}

class BLoadingState extends BasketState{
  late BasketModel basket;
  BLoadingState(this.basket);
}

class BLoadedState extends BasketState{
  BLoadedState();
}

class BErrorState extends BasketState{
  late Exception e;
  BErrorState(this.e);
}