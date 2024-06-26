class CreateAccoutRequestEntite {
  String? fullName;
  String? phomeNumber;
  String? password;
  String? birhdDay;
  int gender;

  CreateAccoutRequestEntite({
    this.fullName,
    this.phomeNumber,
    this.password,
    this.birhdDay,
    this.gender = 0,
  });

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'phoneNumber': phomeNumber,
      'password': password,
      'birthDate': birhdDay,
      'gender': gender,
    };
  }
}
