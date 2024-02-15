import 'package:bookly/core/utils/colors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class BookDescription extends StatelessWidget {
  const BookDescription({
    super.key,
    required this.averageRating,
    required this.ratingCount,
  });
  final num averageRating;
  final num ratingCount;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
         Icon(
          FontAwesomeIcons.solidStar,
          color: goldColor,
          size: 12.w,
        ),
        const Gap(6),
        Text(
          '$averageRating',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 16.sp,
              ),
        ),
        const Gap(4),
        Text(
          '($ratingCount)',
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(fontSize: 14.sp, color: whiteColor),
        ),
        const Spacer()
      ],
    );
  }
}
