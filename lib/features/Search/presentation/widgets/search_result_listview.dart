import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/widgets/best_seller_iteam.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';


class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key, required this.book});
  final BookModel book;
 
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, index) => BookCard(model: book,index:index ,),
      separatorBuilder: (context, index) => const Gap(20),
      itemCount: book.items!.length,
    );
  }
}
