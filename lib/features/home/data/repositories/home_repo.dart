import 'package:bookly/core/error/failures.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failures, BookModel>> getPopularBook(Map<String ,dynamic> queryParameters);
  Future<Either<Failures, BookModel>> getBestSellerBooks();
 Future<Either<Failures, BookModel>> getSimailarBooks({required String category});
}
