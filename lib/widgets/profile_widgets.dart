import 'package:flutter/material.dart';
import 'package:talentaku/constants/app_colors.dart';
import '../constants/app_sizes.dart';
import '../models/profile_models.dart';

// Enum to define box style options
enum BoxStyle { shadow, border }

class TextPairWidget extends StatelessWidget {
  final TextPair model;
  final BoxStyle boxStyle;
  final double? customWidth;
  final double? customHeight;
  final double borderWidth;
  final IconData? icon;  // Menambahkan properti icon

  const TextPairWidget({
    Key? key,
    required this.model,
    this.boxStyle = BoxStyle.shadow,
    this.customWidth,
    this.customHeight,
    this.borderWidth = 1.5,
    this.icon,  // Menambahkan parameter icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BoxDecoration boxDecoration;
    if (boxStyle == BoxStyle.shadow) {
      boxDecoration = BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(2, 4),
          ),
        ],
      );
    } else {
      boxDecoration = BoxDecoration(
        border: Border.all(
          color: AppColors.primary,
          width: borderWidth,
        ),
        borderRadius: BorderRadius.circular(12),
      );
    }

    // Menambahkan ikon pada layout row jika ada
    Widget content = icon == null
        ? Column(
      crossAxisAlignment: model.alignment,
      children: [
        Text(model.primaryText, style: model.primaryStyle),
        Text(model.secondaryText, style: model.secondaryStyle),
      ],
    )
        : Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(icon, size: AppSizes.iconXL, color: model.primaryStyle.color),
        const SizedBox(width: 8),  // Spacing antara ikon dan teks
        Column(
          crossAxisAlignment: model.alignment,
          children: [
            Text(model.primaryText, style: model.primaryStyle),
            Text(model.secondaryText, style: model.secondaryStyle),
          ],
        ),
      ],
    );

    return Container(
      decoration: boxDecoration,
      width: customWidth ?? AppSizes.profileCardWidth,
      height: customHeight ?? AppSizes.profileCardHeigth,
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.paddingS),
        child: content,
      ),
    );
  }
}

