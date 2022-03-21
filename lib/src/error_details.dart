/// Representation of a Chat Error Object.
class ErrorDetails implements Exception {
  String? errorCode;
  String? errorDescription;

  ErrorDetails({
    this.errorCode,
    this.errorDescription,
  });

  ErrorDetails.fromJson(Map<String, dynamic> json) {
    try {
      errorCode = json['errorCode'] ?? "Unknown Error Code";
      errorDescription =
          json['errorDescription'] ?? json["description"] ?? "Unknown Error";
    } catch (e) {
      errorCode = "Unknown Error Code";
      errorDescription = "Unknown Error";
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errorCode'] = this.errorCode;
    data['errorDescription'] = this.errorDescription;
    return data;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
