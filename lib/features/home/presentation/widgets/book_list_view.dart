import 'package:bookly/core/model/book_index.dart';
import 'package:bookly/core/utils/layout/app_size.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/widgets/book_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookListView extends StatelessWidget {
  const BookListView({
    super.key,
    required this.model,
  });
  final BookModel model;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeOfScreen.screenHeight(context) * .25,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => CustomBook(
       bookIndex: BookIndex(bookModel: model, index: index),
        ),
        itemCount: model.items!.length,
        separatorBuilder: (context, index) => const Gap(
          20,
        ),
      ),
    );
  }
}
