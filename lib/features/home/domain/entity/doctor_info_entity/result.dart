class Result {
  String? doctorName;
  String? specialization;
  String? introduction;
  String? address;
  dynamic personalImageUrl;
  dynamic latitude;
  dynamic longitude;
  dynamic phoneNumber;
  String? userName;
  int? id;

  Result({
    this.doctorName,
    this.specialization,
    this.introduction,
    this.address,
    this.personalImageUrl,
    this.latitude,
    this.longitude,
    this.phoneNumber,
    this.userName,
    this.id,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        doctorName: json['doctorName'] as String?,
        specialization: json['specialization'] as String?,
        introduction: json['introduction'] as String?,
        address: json['address'] as String?,
        personalImageUrl: json['personalImageUrl'] as dynamic,
        latitude: json['latitude'] as dynamic,
        longitude: json['longitude'] as dynamic,
        phoneNumber: json['phoneNumber'] as dynamic,
        userName: json['userName'] as String?,
        id: json['id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'doctorName': doctorName,
        'specialization': specialization,
        'introduction': introduction,
        'address': address,
        'personalImageUrl': personalImageUrl,
        'latitude': latitude,
        'longitude': longitude,
        'phoneNumber': phoneNumber,
        'userName': userName,
        'id': id,
      };
}
