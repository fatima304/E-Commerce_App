class VerifyEmailModel {
  final String? message;
  final bool? success;

  VerifyEmailModel({this.message, this.success});

  factory VerifyEmailModel.fromJson(Map<String, dynamic> json) {
    return VerifyEmailModel(
      message: json['message'],
      success: json['success'],
    );
  }
}
