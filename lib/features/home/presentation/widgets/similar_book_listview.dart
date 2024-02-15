import 'package:bookly/core/model/book_index.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/widgets/similar_book_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SimilarBookListView extends StatelessWidget {
  const SimilarBookListView({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => SimilarBookItem(
          book: BookIndex(bookModel: book, index: index),
        ),
        separatorBuilder: (context, index) => const Gap(10),
        itemCount: book.items?.length ?? 0,
      ),
    );
  }
}
