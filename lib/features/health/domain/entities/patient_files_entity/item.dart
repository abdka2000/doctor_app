class Item {
  int? id;
  String? fileUrl;
  String? fileType;
  int? fileSize;
  int? patientId;
  String? fileName;
  DateTime? creationTime;

  Item({
    this.id,
    this.fileUrl,
    this.fileType,
    this.fileSize,
    this.patientId,
    this.fileName,
    this.creationTime,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json['id'] as int?,
        fileUrl: json['fileUrl'] as String?,
        fileType: json['fileType'] as String?,
        fileSize: json['fileSize'] as int?,
        patientId: json['patientId'] as int?,
        fileName: json['fileName'] as String?,
        creationTime: json['creationTime'] == null
            ? null
            : DateTime.parse(json['creationTime'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'fileUrl': fileUrl,
        'fileType': fileType,
        'fileSize': fileSize,
        'patientId': patientId,
        'fileName': fileName,
        'creationTime': creationTime?.toIso8601String(),
      };
}
