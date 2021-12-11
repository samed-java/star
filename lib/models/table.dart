class Table{
  late String id;
  late String name;
  late bool is_empty;
  late bool on_progress;

  Table({
    required this.id,
    required this.name ,
    required this.is_empty,
    required this.on_progress
  }
  );

  factory Table.fromJson(dynamic json){
    return Table(
        id: json["table_id"],
        name: json["table_name"],
        is_empty: json["is_empty"],
        on_progress: json["on_progress"]
    );
  }

}