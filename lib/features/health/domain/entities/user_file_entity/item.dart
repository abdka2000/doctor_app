class Item {
  String? fileUrl;
  String? fileType;
  double? fileSize;
  int? patientId;
  String? fileName;
  DateTime? creationTime;
  int? id;

  Item({
    this.fileUrl,
    this.fileType,
    this.fileSize,
    this.patientId,
    this.fileName,
    this.creationTime,
    this.id,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        fileUrl: json['fileUrl'] as String?,
        fileType: json['fileType'] as String?,
        fileSize: json['fileSize'] as double?,
        patientId: json['patientId'] as int?,
        fileName: json['fileName'] as String?,
        creationTime: json['creationTime'] == null
            ? null
            : DateTime.parse(json['creationTime'] as String),
        id: json['id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'fileUrl': fileUrl,
        'fileType': fileType,
        'fileSize': fileSize,
        'patientId': patientId,
        'fileName': fileName,
        'creationTime': creationTime?.toIso8601String(),
        'id': id,
      };
}
