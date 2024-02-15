import 'package:bookly/core/utils/colors/app_color.dart';
import 'package:bookly/features/Search/manager/search_cubit.dart';
import 'package:bookly/features/Search/presentation/widgets/custom_search_filed.dart';
import 'package:bookly/features/Search/presentation/widgets/empty_search.dart';
import 'package:bookly/features/Search/presentation/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<SearchCubit>(context);
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_sharp,
                color: whiteColor,
              ),
            ),
            title: CustomSearchFiled(
              onChanged: (value) {
                bloc.search(value: value);
              },
              controller: bloc.searchController,
            ),
            centerTitle: true,
          ),
          body: bloc.searchController.text.isEmpty
              ? const NoSearchIteam()
              : SearchViewBody(
                  book: bloc.books!,
                ),
        );
      },
    );
  }
}
