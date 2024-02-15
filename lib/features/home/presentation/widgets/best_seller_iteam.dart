import 'package:bookly/config/router/routes.dart';
import 'package:bookly/core/utils/colors/app_color.dart';
import 'package:bookly/core/utils/constant/constant.dart';
import 'package:bookly/core/utils/helper/shimmer.dart';
import 'package:bookly/core/utils/layout/app_size.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/core/model/book_index.dart';
import 'package:bookly/features/home/presentation/widgets/price_and_rating.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key, required this.model, required this.index});
  final BookModel? model;
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.details,
            arguments: BookIndex(bookModel: model!, index: index));
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              placeholder: (context, url) => ShimmerEffect(
                width: SizeOfScreen.getWidth(70, context),
                child: Container(
                  color: Colors.grey.withOpacity(.1),
                ),
              ),
              imageUrl: model
                      ?.items?[index].volumeInfo?.imageLinks?.thumbnail ??
                  'https://as2.ftcdn.net/jpg/00/85/97/87/500_F_85978727_1qnXNzbVgChJBTG941vhlHLaGTAWFED6.jpg',
              width: SizeOfScreen.getWidth(70, context),
              height: SizeOfScreen.getHeight(105, context),
              fit: BoxFit.fill,
            ),
          ),
          const Gap(30),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model!.items![index].volumeInfo!.title!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontFamily: kFontGt, fontSize: 20),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const Gap(5),
                Text(
                  model!.items?[index].volumeInfo?.authors?[0] ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: whiteColor),
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                ),
                const Gap(5),
                PriceAndRating(
                  price: model!.items![index].saleInfo!.saleability!,
                  stareRating:
                      model?.items?[index].volumeInfo?.averageRating ?? 0,
                  ratingCount:
                      model?.items?[index].volumeInfo?.ratingsCount ?? 0,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
