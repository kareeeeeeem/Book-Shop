import 'package:bookly/core/utils/colors/app_color.dart';
import 'package:bookly/core/utils/layout/app_size.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BookShimmer extends StatelessWidget {
  const BookShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: darkBackGroundColor,
      child: Container(
        width: SizeOfScreen.getWidth(120, context),
        height: SizeOfScreen.getHeight(120, context),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey.withOpacity(.1)),
      ),
    );
  }
}
