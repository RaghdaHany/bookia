import 'data.dart';

class UserResponse {
  Data? data;
  String? message;
  List<dynamic>? error;
  num? status;

  UserResponse({this.data, this.message, this.error, this.status});

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
    data:
        json['data'] == null
            ? null
            : Data.fromJson(Map<String, dynamic>.from(json['data'])),
    message: json['message']?.toString(),
    error: List<dynamic>.from(json['error'] ?? []),
    status: num.tryParse(json['status'].toString()),
  );

  Map<String, dynamic> toJson() => {
    if (data != null) 'data': data?.toJson(),
    if (message != null) 'message': message,
    if (error != null) 'error': error,
    if (status != null) 'status': status,
  };
}
