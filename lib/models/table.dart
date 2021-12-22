class TableModel{
  late String id;
  late String name;
  late bool is_empty;
  late bool on_progress;

  TableModel({
    required this.id,
    required this.name ,
    required this.is_empty,
    required this.on_progress
  }
  );

  factory TableModel.fromJson(dynamic json){
    return TableModel(
        id: json["table_id"],
        name: json["table_name"],
        is_empty: json["is_empty"],
        on_progress: json["on_progress"]
    );
  }

}