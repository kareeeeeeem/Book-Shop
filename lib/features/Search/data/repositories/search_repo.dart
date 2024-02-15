import 'package:bookly/core/error/failures.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
   Future<Either<Failures, BookModel>> searchBook({required String searchIteam});
}
