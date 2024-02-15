
import 'package:bookly/core/utils/components/book_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookLoadingEffect extends StatelessWidget {
  const BookLoadingEffect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => const BookShimmer(),
          separatorBuilder: (context, index) => const Gap(10),
          itemCount: 10),
    );
  }
}
