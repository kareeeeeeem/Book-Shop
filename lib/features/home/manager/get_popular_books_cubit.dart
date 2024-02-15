import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repositories/home_repo.dart';
import 'package:equatable/equatable.dart';
part 'get_popular_books_state.dart';

class GetPopularBooksCubit extends Cubit<GetPopularBooksState> {
  GetPopularBooksCubit(this.homeRepo) : super(GetPopularBooksInitial());
  final HomeRepo homeRepo;
  BookModel? bookModel;
  Future<void> getPopularBooks({required Map<String, dynamic> query}) async {
    emit(GetPopularBooksLoading());
    var result = await homeRepo.getPopularBook(query);
    result.fold((faluir) {
      emit(GetPopularBooksError(errorMassage: faluir.error));
    }, (books) {
      emit(GetPopularBooksSuccess());
      bookModel = books;
    });
  }
}
