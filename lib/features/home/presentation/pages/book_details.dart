import 'package:bookly/core/model/book_index.dart';
import 'package:bookly/core/service_locator/locator.dart';
import 'package:bookly/features/home/data/repositories/homerepo_implementation.dart';
import 'package:bookly/features/home/manager/get_simailer_books_cubit.dart';
import 'package:bookly/features/home/presentation/widgets/details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({super.key});

  @override
  Widget build(BuildContext context) {
    BookIndex bookModel =
        ModalRoute.of(context)!.settings.arguments as BookIndex;
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => GetSimailerBooksCubit(getIt.get<HomeRepoImplemetation>())..getSimllerBooks(category: bookModel.bookModel.items![bookModel.index].volumeInfo!.categories![0]),
          child: DetailsViewBody(
            bookIndex: bookModel,
          ),
        ),
      ),
    );
  }
}
