import 'dart:convert';

class TheMovieDbErrorResponse {
  bool? success;
  int? statusCode;
  String? statusMessage;

  TheMovieDbErrorResponse({
    this.success,
    this.statusCode,
    this.statusMessage,
  });

  factory TheMovieDbErrorResponse.fromJson(String str) => TheMovieDbErrorResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TheMovieDbErrorResponse.fromMap(Map<String, dynamic> json) => TheMovieDbErrorResponse(
        success: json["success"],
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "status_code": statusCode,
        "status_message": statusMessage,
      };
}
