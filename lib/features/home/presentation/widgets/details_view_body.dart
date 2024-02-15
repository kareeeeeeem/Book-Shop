import 'package:bookly/core/model/book_index.dart';
import 'package:bookly/core/utils/colors/app_color.dart';
import 'package:bookly/features/home/manager/get_simailer_books_cubit.dart';
import 'package:bookly/features/home/presentation/widgets/book_details_scrion.dart';
import 'package:bookly/features/home/presentation/widgets/custom_book_price.dart';
import 'package:bookly/features/home/presentation/widgets/details_custom_appbar.dart';
import 'package:bookly/features/home/presentation/widgets/similar_book_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({
    super.key,
    required this.bookIndex,
  });

  final BookIndex bookIndex;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 30.0, right: 30, bottom: 10, top: 40),
            child: Column(
              children: [
                const DetialsCustomAppBar(),
                const Gap(30),
                BookDetailsSection(
                  img: bookIndex.bookModel.items![bookIndex.index].volumeInfo!
                          .imageLinks?.thumbnail ??
                      'https://th.bing.com/th/id/OIP.N0gCnBAfUaHLWOVZ8v9_PgHaHa?rs=1&pid=ImgDetMain',
                  title: bookIndex.bookModel.items![bookIndex.index].volumeInfo!
                          .title ??
                      '',
                  description: bookIndex.bookModel.items![bookIndex.index]
                          .volumeInfo!.description ??
                      '',
                  rating: bookIndex.bookModel.items?[bookIndex.index].volumeInfo
                          ?.ratingsCount ??
                      0,
                  averageRating: bookIndex.bookModel.items?[bookIndex.index]
                          .volumeInfo?.averageRating ??
                      0,
                ),
                const Gap(35),
                BookPrice(
                  price: bookIndex
                      .bookModel.items![bookIndex.index].saleInfo!.saleability!,
                  url: bookIndex.bookModel.items![bookIndex.index].volumeInfo!
                          .previewLink ??
                      '',
                ),
                const Gap(50),
                Expanded(
                  child:
                      BlocBuilder<GetSimailerBooksCubit, GetSimailerBooksState>(
                    builder: (context, state) {
                      if (state is GetSimailerBooksLoading) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: goldColor,
                          ),
                        );
                      } else if (state is GetSimailerBooksError) {
                        return Center(
                          child: Text(state.errorMassage),
                        );
                      } else {
                        return SimilerBookSection(
                            book:
                                BlocProvider.of<GetSimailerBooksCubit>(context)
                                    .bookModel!);
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
