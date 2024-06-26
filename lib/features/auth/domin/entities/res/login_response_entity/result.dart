class Result {
  String? accessToken;
  String? encryptedAccessToken;
  int? expireInSeconds;
  int? userId;

  Result({
    this.accessToken,
    this.encryptedAccessToken,
    this.expireInSeconds,
    this.userId,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        accessToken: json['accessToken'] as String?,
        encryptedAccessToken: json['encryptedAccessToken'] as String?,
        expireInSeconds: json['expireInSeconds'] as int?,
        userId: json['userId'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'accessToken': accessToken,
        'encryptedAccessToken': encryptedAccessToken,
        'expireInSeconds': expireInSeconds,
        'userId': userId,
      };
}
