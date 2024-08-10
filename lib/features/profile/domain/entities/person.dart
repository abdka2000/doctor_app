class Person {
  final int? id;
  String? fullName;
  DateTime? birthDate;
  String? phoneNumber;
  int? gender;

  Person(
      {required this.id,
      required this.fullName,
      required this.birthDate,
      required this.phoneNumber,
      required this.gender});

      
  factory Person.fromJson(Map<String, dynamic> data) {
    Map<String, dynamic> json = data['result'];
    return Person(
      id: json['id'] as int?,
      fullName: json['fullName'] as String?,
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
      phoneNumber: json['phoneNumber'] as String?,
      gender: json['gender'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'fullName': fullName,
        'birthDate': birthDate?.toIso8601String(),
        'phoneNumber': phoneNumber,
        'gender': gender,
      };
}
