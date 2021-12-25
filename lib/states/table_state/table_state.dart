import 'package:star/models/table.dart';

abstract class TableState{
  TableState();
}

class InitState extends TableState {
  InitState();
}

class LoadingState extends TableState{
  LoadingState();
}

class LoadedState extends TableState{
  late Future<TableModel> table;
  LoadedState(this.table){
    print( "table is: ${this.table.toString()}");
  }
}

class ErrorState extends TableState{
  late Exception e;

  ErrorState(this.e);
}