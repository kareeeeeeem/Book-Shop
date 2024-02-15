import 'package:bookly/core/utils/colors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({
    super.key,
    required this.width,
    required this.child,
  });
  final double width;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Shimmer.fromColors(
          baseColor: Colors.white,
          highlightColor: darkBackGroundColor,
          child: child),
    );
  }
}
