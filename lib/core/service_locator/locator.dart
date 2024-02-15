import 'package:bookly/core/api/api_manager.dart';
import 'package:bookly/features/Search/data/repositories/search_repo_implmentation.dart';
import 'package:bookly/features/home/data/repositories/homerepo_implementation.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setUpLocator() {
  getIt.registerSingleton<ApiManager>(ApiManager(Dio()));
  getIt.registerSingleton<HomeRepoImplemetation>(
      HomeRepoImplemetation(apiManager: getIt.get<ApiManager>()));
  getIt.registerSingleton<SearchRepoImplementation>(
      SearchRepoImplementation(apiManager: getIt.get<ApiManager>()));
}
