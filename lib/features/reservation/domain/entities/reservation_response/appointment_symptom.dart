class AppointmentSymptom {
  int? symptomId;

  AppointmentSymptom({this.symptomId});

  factory AppointmentSymptom.fromJson(Map<String, dynamic> json) {
    return AppointmentSymptom(
      symptomId: json['symptomId'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'symptomId': symptomId,
      };
}
