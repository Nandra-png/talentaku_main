import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/profile_models.dart';

class ProfileController extends GetxController {
  var user = Rx<UserModel>(
    UserModel(
      name: 'Narendra',
      nis: '123456',
      birthPlaceAndDate: 'Jakarta, 1 Januari 2000',
      address: 'Jl. Raya No. 1',
    ),
  );

  TextPair getTextPair(String primaryText) {
    String secondaryText;
    switch (primaryText) {
      case 'Nama Lengkap':
        secondaryText = user.value.name;
        break;
      case 'NIS':
        secondaryText = user.value.nis;
        break;
      case 'Tempat, Tanggal Lahir':
        secondaryText = user.value.birthPlaceAndDate;
        break;
      case 'Alamat':
        secondaryText = user.value.address;
        break;
      default:
        secondaryText = '';
    }

    return TextPair(
      primaryText: primaryText,
      secondaryText: secondaryText,
      primaryStyle: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
      secondaryStyle: TextStyle(fontSize: 14, color: Colors.grey),
      alignment: CrossAxisAlignment.start,
    );
  }
}
