import 'package:bloc/bloc.dart';
import 'package:bookly/core/error/failures.dart';
import 'package:bookly/features/Search/data/repositories/search_repo.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  TextEditingController searchController = TextEditingController();
  BookModel? books;
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;
  Future<void> searchBook() async {
    emit(SearchLoadingState());
    Either<Failures, BookModel> data =
        await searchRepo.searchBook(searchIteam: searchController.text);
    data.fold((fail) {
      emit(SearchErrorState(errorMassage: fail.error));
    }, (book) {
      books = book;
      emit(SearchSuccessState());
    });
  }

  void search({required String value}) {
    searchController.text = value;
    searchBook();
    emit(ChangeSearch());
  }
}
