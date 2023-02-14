// To parse this JSON data, do
//
//     final emailverify = emailverifyFromJson(jsonString);

import 'dart:convert';

Emailverify emailverifyFromJson(String str) =>
    Emailverify.fromJson(json.decode(str));

String emailverifyToJson(Emailverify data) => json.encode(data.toJson());

class Emailverify {
  Emailverify({
    required this.email,
    required this.autocorrect,
    required this.deliverability,
    required this.qualityScore,
    required this.isValidFormat,
    required this.isFreeEmail,
    required this.isDisposableEmail,
    required this.isRoleEmail,
    required this.isCatchallEmail,
    required this.isMxFound,
    required this.isSmtpValid,
  });

  String email;
  String autocorrect;
  String deliverability;
  String qualityScore;
  Is isValidFormat;
  Is isFreeEmail;
  Is isDisposableEmail;
  Is isRoleEmail;
  Is isCatchallEmail;
  Is isMxFound;
  Is isSmtpValid;

  Emailverify copyWith({
    String? email,
    String? autocorrect,
    String? deliverability,
    String? qualityScore,
    Is? isValidFormat,
    Is? isFreeEmail,
    Is? isDisposableEmail,
    Is? isRoleEmail,
    Is? isCatchallEmail,
    Is? isMxFound,
    Is? isSmtpValid,
  }) =>
      Emailverify(
        email: email ?? this.email,
        autocorrect: autocorrect ?? this.autocorrect,
        deliverability: deliverability ?? this.deliverability,
        qualityScore: qualityScore ?? this.qualityScore,
        isValidFormat: isValidFormat ?? this.isValidFormat,
        isFreeEmail: isFreeEmail ?? this.isFreeEmail,
        isDisposableEmail: isDisposableEmail ?? this.isDisposableEmail,
        isRoleEmail: isRoleEmail ?? this.isRoleEmail,
        isCatchallEmail: isCatchallEmail ?? this.isCatchallEmail,
        isMxFound: isMxFound ?? this.isMxFound,
        isSmtpValid: isSmtpValid ?? this.isSmtpValid,
      );

  factory Emailverify.fromJson(Map<String, dynamic> json) => Emailverify(
        email: json["email"],
        autocorrect: json["autocorrect"],
        deliverability: json["deliverability"],
        qualityScore: json["quality_score"],
        isValidFormat: Is.fromJson(json["is_valid_format"]),
        isFreeEmail: Is.fromJson(json["is_free_email"]),
        isDisposableEmail: Is.fromJson(json["is_disposable_email"]),
        isRoleEmail: Is.fromJson(json["is_role_email"]),
        isCatchallEmail: Is.fromJson(json["is_catchall_email"]),
        isMxFound: Is.fromJson(json["is_mx_found"]),
        isSmtpValid: Is.fromJson(json["is_smtp_valid"]),
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "autocorrect": autocorrect,
        "deliverability": deliverability,
        "quality_score": qualityScore,
        "is_valid_format": isValidFormat.toJson(),
        "is_free_email": isFreeEmail.toJson(),
        "is_disposable_email": isDisposableEmail.toJson(),
        "is_role_email": isRoleEmail.toJson(),
        "is_catchall_email": isCatchallEmail.toJson(),
        "is_mx_found": isMxFound.toJson(),
        "is_smtp_valid": isSmtpValid.toJson(),
      };
}

class Is {
  Is({
    required this.value,
    required this.text,
  });

  bool value;
  String text;

  Is copyWith({
    bool? value,
    String? text,
  }) =>
      Is(
        value: value ?? this.value,
        text: text ?? this.text,
      );

  factory Is.fromJson(Map<String, dynamic> json) => Is(
        value: json["value"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "text": text,
      };
}
//https://emailvalidation.abstractapi.com/v1/?api_key=f5cb8bc71c904298ab3c60c0e8ef464f&email=chiomag58@gmail.com