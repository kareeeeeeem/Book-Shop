import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repositories/homerepo_implementation.dart';
import 'package:equatable/equatable.dart';


part 'get_simailer_books_state.dart';

class GetSimailerBooksCubit extends Cubit<GetSimailerBooksState> {
  GetSimailerBooksCubit(this.homeRepo) : super(GetSimailerBooksInitial());
    final HomeRepoImplemetation homeRepo;
  BookModel? bookModel;
  Future<void> getSimllerBooks({required String category}) async {
    emit(GetSimailerBooksLoading());
    var result = await homeRepo.getSimailarBooks(category:category );
    result.fold((faluir) {
      emit(GetSimailerBooksError(errorMassage: faluir.error));
    }, (books) {
      emit(GetSimailerBooksSuccess());
      bookModel = books;
    });
  }
}
