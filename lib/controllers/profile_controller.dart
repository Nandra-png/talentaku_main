import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentaku/constants/app_colors.dart';
import '../models/profile_models.dart';

class ProfileController extends GetxController {
  var user = Rx<UserModel>(
    UserModel(
      name: 'Narendra',
      nis: '123456',
      birthPlaceAndDate: 'Jakarta, 1 Januari 2000',
      address: 'Jl. Raya No. 1',
      group: 'Pelangi',
    ),
  );

  TextPair getTextPair(String primaryText) {
    String secondaryText;
    IconData? icon;

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
      case 'Kelompok':
        secondaryText = user.value.group;
        icon = Icons.group; 
        break;
      default:
        secondaryText = '';
    }

    return TextPair(
      primaryText: primaryText,
      secondaryText: secondaryText,
      primaryStyle: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 18, color: AppColors.textDark),
      secondaryStyle: TextStyle(fontSize: 14, color: AppColors.textPrimary),
      alignment: CrossAxisAlignment.start,
      icon: icon, // Pass icon if available
    );
  }

}

