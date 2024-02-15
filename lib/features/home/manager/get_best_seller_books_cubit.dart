import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repositories/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'get_best_seller_books_state.dart';

class GetBestSellerBooksCubit extends Cubit<GetBestSellerBooksState> {
  GetBestSellerBooksCubit(this.homeRepo) : super(GetBestSellerBooksInitial());
  final HomeRepo homeRepo;
  BookModel? bookModel;
  Future<void> getBestSellerBooks() async {
    emit(GetBestSellerBooksLoading());
    var result = await homeRepo.getBestSellerBooks();
    result.fold((faluir) {
      emit(GetBestSellerBooksError(errorMassage: faluir.error));
    }, (books) {
      emit(GetBestSellerBooksSuccess());
      bookModel = books;
    });
  }
}
