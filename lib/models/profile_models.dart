import 'package:flutter/material.dart';

class UserModel {
  final String name;
  final String nis;
  final String birthPlaceAndDate;
  final String address;

  UserModel({
    required this.name,
    required this.nis,
    required this.birthPlaceAndDate,
    required this.address,
  });
}

class TextPair { // Fix: Rename from TextPaiR to TextPair
  final String primaryText;
  final String secondaryText;
  final TextStyle primaryStyle;
  final TextStyle secondaryStyle;
  final CrossAxisAlignment alignment;

  TextPair({
    required this.primaryText,
    required this.secondaryText,
    required this.primaryStyle,
    required this.secondaryStyle,
    required this.alignment,
  });
}
