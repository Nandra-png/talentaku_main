import 'package:flutter/material.dart';
import '../models/profile_models.dart';
import '../constants/app_decorations.dart';
import '../constants/app_sizes.dart';

class TextPairWidget extends StatelessWidget {
  final TextPair model;

  const TextPairWidget({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecorations.cardDecoration,  // Apply the decoration here
      width: AppSizes.profileCardWidth,  // Use the cardWidth from AppSizes
      height: AppSizes.profileCardHeigth,  // Use the cardHeight from AppSizes
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.paddingM),  // Use your padding constant
        child: Column(
          crossAxisAlignment: model.alignment,
          children: [
            Text(model.primaryText, style: model.primaryStyle),
            Text(model.secondaryText, style: model.secondaryStyle),
          ],
        ),
      ),
    );
  }
}
