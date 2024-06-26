import 'package:hosptel_app/features/profile/domain/entities/person.dart';

class PersonModel extends Person {
  PersonModel({
    super.id,
    super.fullName,
    super.birthDate,
    super.phoneNumber,
    super.gender,
  });

  factory PersonModel.fromJson(Map<String, dynamic> data) {
    Map<String, dynamic> json = data['result'];
    return PersonModel(
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
