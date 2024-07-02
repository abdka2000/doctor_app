class Item {
  int? id;
  int? amount;
  DateTime? creationTime;

  Item({this.id, this.amount, this.creationTime});

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json['id'] as int?,
        amount: json['amount'] as int?,
        creationTime: json['creationTime'] == null
            ? null
            : DateTime.parse(json['creationTime'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'amount': amount,
        'creationTime': creationTime?.toIso8601String(),
      };
}
