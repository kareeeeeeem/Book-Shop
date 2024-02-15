import 'package:bookly/core/api/api_manager.dart';
import 'package:bookly/core/api/end_ponits.dart';
import 'package:bookly/core/error/failures.dart';
import 'package:bookly/features/Search/data/repositories/search_repo.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImplementation implements SearchRepo {
  final ApiManager apiManager;
 const SearchRepoImplementation({required this.apiManager});
  @override
  Future<Either<Failures, BookModel>> searchBook(
      {required String searchIteam}) async {
    try {
      var data = await apiManager.get(
          endPoint: EndPoint.volumes,
          queryParameters: {'q': 'subject:$searchIteam',
           'Filtering':'ebooks',});
      BookModel book = BookModel.fromJson(data);
      return right(book);
    } on DioException catch (e) {
      return left(ServerFailure(error: e.message!));
    } catch (e) {
      return left(ServerFailure(error: e.toString()));
    }
  }
}
