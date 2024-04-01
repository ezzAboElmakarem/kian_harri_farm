class OrderType {
  int? id;
  String? name;

  OrderType({this.id, this.name});

  factory OrderType.fromJson(Map<String, dynamic> json) => OrderType(
        id: json['id'] as int?,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
