import 'package:bookly/core/service_locator/locator.dart';
import 'package:bookly/features/home/data/repositories/homerepo_implementation.dart';
import 'package:bookly/features/home/manager/get_best_seller_books_cubit.dart';
import 'package:bookly/features/home/manager/get_popular_books_cubit.dart';
import 'package:bookly/features/home/presentation/widgets/best_seller_iteam_listview.dart';
import 'package:bookly/features/home/presentation/widgets/best_seller_text.dart';
import 'package:bookly/features/home/presentation/widgets/book_list_view.dart';
import 'package:bookly/features/home/presentation/widgets/custom_appbar.dart';
import 'package:bookly/features/home/presentation/widgets/loading_book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 30.0, right: 30, bottom: 10, top: 40),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBar(),
                const Gap(30),
                BlocProvider(
                  create: (context) =>
                      GetPopularBooksCubit(getIt.get<HomeRepoImplemetation>())
                        ..getPopularBooks(query: {'q': 'programming'}),
                  child:
                      BlocBuilder<GetPopularBooksCubit, GetPopularBooksState>(
                    builder: (context, state) {
                      var bloc = BlocProvider.of<GetPopularBooksCubit>(context);
                      if (state is GetPopularBooksLoading) {
                        return const BookLoadingEffect();
                      } else if (state is GetPopularBooksError) {
                        return Center(
                          child: Text(state.errorMassage),
                        );
                      } else {
                        return BookListView(
                          model: bloc.bookModel!,
                        );
                      }
                    },
                  ),
                ),
                const Gap(30),
                 CustomHeadLineText(
                  txt: AppLocalizations.of(context)!.newsetBooks,
                ),
                const Gap(20),
              ],
            ),
          ),
          SliverFillRemaining(
            child: BlocProvider(
                create: (context) =>
                    GetBestSellerBooksCubit(getIt.get<HomeRepoImplemetation>())
                      ..getBestSellerBooks(),
                child: const BookListViewItem()),
          )
        ],
      ),
    );
  }
}
