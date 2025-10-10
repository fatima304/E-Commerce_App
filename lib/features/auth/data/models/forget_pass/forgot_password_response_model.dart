class ForgotPasswordResponseModel {
  final String message;

  ForgotPasswordResponseModel({required this.message});

  factory ForgotPasswordResponseModel.fromJson(dynamic json) {
    if (json is String) {
      return ForgotPasswordResponseModel(message: json);
    } else if (json is Map<String, dynamic>) {
      final message = json['message'] as String? ?? 'OTP sent successfully';
      return ForgotPasswordResponseModel(message: message);
    } else {
      return ForgotPasswordResponseModel(message: "Something went wrong");
    }
  }

  Map<String, dynamic> toJson() => {
    'message': message,
  };
}
