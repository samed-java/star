class TableModel{
  late String id;
  late String name;
  late int is_empty;
  late int on_progress;


  TableModel.emp();

  TableModel({
    required this.id,
    required this.name ,
    required this.is_empty,
    required this.on_progress
  }
  );

  factory TableModel.fromJson(dynamic json){
    return TableModel(
        id: json["table_id"].toString(),
        name: json["table_name"],
        is_empty: json["is_empty"],
        on_progress: json["on_progress"]
    );
  }

  @override
  String toString() {
    return 'TableModel{id: $id, name: $name, is_empty: $is_empty, on_progress: $on_progress}';
  }
}