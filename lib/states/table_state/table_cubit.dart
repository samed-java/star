import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star/models/table.dart';
import 'package:star/services/table_service.dart';
import 'package:star/states/table_state/table_state.dart';

class TableCubit extends Cubit<TableState>{

  TableCubit():super(InitState());

  void getData(){
      try{
        emit(LoadingState());
        Future<TableModel> table = TableService.getData() as Future<TableModel>;
        emit(LoadedState(table));
      }on Exception catch(e){
        emit(ErrorState(e));
      }
  }
}