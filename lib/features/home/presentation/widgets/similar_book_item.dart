import 'package:bookly/config/router/routes.dart';
import 'package:bookly/core/model/book_index.dart';
import 'package:bookly/core/utils/helper/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SimilarBookItem extends StatelessWidget {
  const SimilarBookItem({super.key, required this.book});
  final BookIndex book;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacementNamed(context, AppRoutes.details,arguments: book);
      },
      child: SizedBox(
        width: 70,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: AspectRatio(
              aspectRatio: 1 / 3,
              child: CachedNetworkImage(
                imageUrl: book.bookModel.items?[book.index].volumeInfo
                        ?.imageLinks?.thumbnail ??
                    'https://th.bing.com/th/id/OIP.N0gCnBAfUaHLWOVZ8v9_PgHaHa?rs=1&pid=ImgDetMain',
                fit: BoxFit.fill,
                placeholder: (context, url) => ShimmerEffect(
                    width: 70,
                    child: Container(
                      color:Colors.grey.withOpacity(.1),
                    )),
              )),
        ),
      ),
    );
  }
}
