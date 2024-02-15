import 'package:bookly/core/api/api_manager.dart';
import 'package:bookly/core/api/end_ponits.dart';
import 'package:bookly/core/error/failures.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repositories/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImplemetation implements HomeRepo {
  final ApiManager apiManager;

  HomeRepoImplemetation({required this.apiManager});
  @override
  Future<Either<Failures, BookModel>> getBestSellerBooks(
      ) async {
    try {
      var data =
          await apiManager.get(endPoint: EndPoint.volumes, queryParameters: {
        'q': 'subject:science', 
        'Sorting':'newset', 
        'Filtering':'ebooks', 

      });
      BookModel model = BookModel.fromJson(data);
      return right(model);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failures, BookModel>> getPopularBook(Map<String ,dynamic> queryParameters) async{
    try {
      var data =
          await apiManager.get(endPoint: EndPoint.volumes, queryParameters:queryParameters);
      BookModel model = BookModel.fromJson(data);
      return right(model);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(error: e.toString()));
    }
  }
  
  @override
  Future<Either<Failures, BookModel>> getSimailarBooks({required String category}) async{
   try {
      var data =
          await apiManager.get(endPoint: EndPoint.volumes, queryParameters: {
        'q': 'subject:$category', 
        'Filtering':'ebooks', 
        'Sorting':'relevance'
      });
      BookModel model = BookModel.fromJson(data);
      return right(model);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(error: e.toString()));
    } 
  }
}
