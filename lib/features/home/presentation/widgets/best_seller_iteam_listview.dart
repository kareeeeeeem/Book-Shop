import 'package:bookly/core/utils/components/loading_effect.dart';
import 'package:bookly/features/home/manager/get_best_seller_books_cubit.dart';
import 'package:bookly/features/home/presentation/widgets/best_seller_iteam.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetBestSellerBooksCubit, GetBestSellerBooksState>(
      builder: (context, state) {
        if (state is GetBestSellerBooksLoading) {
          return ListView.separated(
            separatorBuilder: (context, index) => const Gap(10),
            itemBuilder: (context, index) => const LoadingEffect(),
            itemCount: 20,
          );
        } else if (state is GetBestSellerBooksError) {
          return Center(
            child: Text(state.errorMassage),
          );
        } else {
          var bloc = BlocProvider.of<GetBestSellerBooksCubit>(context);
          return ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) => BookCard(
              model: bloc.bookModel!,
              index: index,
            ),
            separatorBuilder: (context, index) => const Gap(20),
            itemCount: bloc.bookModel!.items!.length,
          );
        }
      },
    );
  }
}
