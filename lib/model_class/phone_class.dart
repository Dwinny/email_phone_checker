// To parse this JSON data, do
//
//     final phoneVerify = phoneVerifyFromJson(jsonString);

import 'dart:convert';

PhoneVerify phoneVerifyFromJson(String str) =>
    PhoneVerify.fromJson(json.decode(str));

String phoneVerifyToJson(PhoneVerify data) => json.encode(data.toJson());

class PhoneVerify {
  PhoneVerify({
    required this.phone,
    required this.valid,
    required this.format,
    required this.country,
    required this.location,
    required this.type,
    required this.carrier,
  });

  String phone;
  bool valid;
  Format format;
  Country country;
  String location;
  String type;
  String carrier;

  PhoneVerify copyWith({
    String? phone,
    bool? valid,
    Format? format,
    Country? country,
    String? location,
    String? type,
    String? carrier,
  }) =>
      PhoneVerify(
        phone: phone ?? this.phone,
        valid: valid ?? this.valid,
        format: format ?? this.format,
        country: country ?? this.country,
        location: location ?? this.location,
        type: type ?? this.type,
        carrier: carrier ?? this.carrier,
      );

  factory PhoneVerify.fromJson(Map<String, dynamic> json) => PhoneVerify(
        phone: json["phone"],
        valid: json["valid"],
        format: Format.fromJson(json["format"]),
        country: Country.fromJson(json["country"]),
        location: json["location"],
        type: json["type"],
        carrier: json["carrier"],
      );

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "valid": valid,
        "format": format.toJson(),
        "country": country.toJson(),
        "location": location,
        "type": type,
        "carrier": carrier,
      };
}

class Country {
  Country({
    required this.code,
    required this.name,
    required this.prefix,
  });

  String code;
  String name;
  String prefix;

  Country copyWith({
    String? code,
    String? name,
    String? prefix,
  }) =>
      Country(
        code: code ?? this.code,
        name: name ?? this.name,
        prefix: prefix ?? this.prefix,
      );

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        code: json["code"],
        name: json["name"],
        prefix: json["prefix"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "prefix": prefix,
      };
}

class Format {
  Format({
    required this.international,
    required this.local,
  });

  String international;
  String local;

  Format copyWith({
    String? international,
    String? local,
  }) =>
      Format(
        international: international ?? this.international,
        local: local ?? this.local,
      );

  factory Format.fromJson(Map<String, dynamic> json) => Format(
        international: json["international"],
        local: json["local"],
      );

  Map<String, dynamic> toJson() => {
        "international": international,
        "local": local,
      };
}
//https://phonevalidation.abstractapi.com/v1/?api_key=3b4f4adb3c464c2691d39cb918e913e2&phone=14152007986