part of 'search_cubit.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchSuccessState extends SearchState {}

class SearchErrorState extends SearchState {
  final String errorMassage;

  SearchErrorState({required this.errorMassage});
}
class ChangeSearch extends SearchState {}