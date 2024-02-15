import 'package:bookly/config/router/routes.dart';
import 'package:bookly/core/model/book_index.dart';
import 'package:bookly/core/utils/helper/shimmer.dart';
import 'package:bookly/core/utils/layout/app_size.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBook extends StatelessWidget {
  const CustomBook({super.key,  required this.bookIndex});
 final BookIndex bookIndex;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.details,
            arguments: BookIndex(bookModel: bookIndex.bookModel, index: bookIndex.index));
      },
      child: SizedBox(
        width: SizeOfScreen.screenWidth(context) * .35,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: AspectRatio(
            aspectRatio: 1 / 3,
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl:
                  bookIndex.bookModel.items![bookIndex.index].volumeInfo!.imageLinks!.thumbnail!,
              placeholder: (context, url) => ShimmerEffect(
                width: SizeOfScreen.screenWidth(context) * .35,
                child: Container(
                  color: Colors.grey.withOpacity(.1),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
