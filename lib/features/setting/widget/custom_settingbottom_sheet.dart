import 'package:bookly/core/utils/colors/app_color.dart';
import 'package:bookly/core/utils/layout/app_size.dart';
import 'package:flutter/material.dart';

class CustomSettingBottomSheet extends StatelessWidget {
  const CustomSettingBottomSheet({super.key, this.onTap, required this.text});
  final Function()? onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        width: SizeOfScreen.screenWidth(context),
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: whiteColor, width: 1),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
