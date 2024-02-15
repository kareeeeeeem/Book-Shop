part of 'get_popular_books_cubit.dart';

sealed class GetPopularBooksState extends Equatable {
  const GetPopularBooksState();

  @override
  List<Object> get props => [];
}

final class GetPopularBooksInitial extends GetPopularBooksState {}

final class GetPopularBooksLoading extends GetPopularBooksState {}

final class GetPopularBooksSuccess extends GetPopularBooksState {}

final class GetPopularBooksError extends GetPopularBooksState {
  final String errorMassage;

 const GetPopularBooksError({required this.errorMassage});

}
