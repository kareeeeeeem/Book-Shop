import 'package:bookly/core/utils/colors/app_color.dart';
import 'package:bookly/core/utils/constant/constant.dart';
import 'package:bookly/core/utils/helper/shimmer.dart';
import 'package:bookly/core/utils/layout/app_size.dart';
import 'package:bookly/features/home/presentation/widgets/book_description.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection(
      {super.key,
      required this.img,
      required this.title,
      required this.description,
      required this.rating,
      required this.averageRating});
  final String img;
  final String title;
  final String description;

  final num rating;
  final num averageRating;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              imageUrl: img,
              width: SizeOfScreen.getWidth(162, context),
              height: SizeOfScreen.getHeight(250, context),
              fit: BoxFit.fill,
              placeholder: (context, url) => ShimmerEffect(
                width: SizeOfScreen.getWidth(162, context),
                child: Container(
                  color: Colors.grey.withOpacity(.1),
                ),
              ),
            ),
          ),
        ),
        const Gap(20),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontFamily: kFontGt, fontSize: 30),
          textAlign: TextAlign.center,
          maxLines: 1,
        ),
        const Gap(5),
        Text(
          description,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: whiteColor),
          textAlign: TextAlign.center,
          maxLines: 2,
        ),
        const Gap(14),
        BookDescription(
          averageRating: averageRating,
          ratingCount: rating,
        ),
      ],
    );
  }
}
