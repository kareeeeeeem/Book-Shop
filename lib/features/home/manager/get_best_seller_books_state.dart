part of 'get_best_seller_books_cubit.dart';

sealed class GetBestSellerBooksState extends Equatable {
  const GetBestSellerBooksState();

  @override
  List<Object> get props => [];
}

final class GetBestSellerBooksInitial extends GetBestSellerBooksState {}

final class GetBestSellerBooksLoading extends GetBestSellerBooksState {}

final class GetBestSellerBooksSuccess extends GetBestSellerBooksState {}

final class GetBestSellerBooksError extends GetBestSellerBooksState {
  final String errorMassage;

 const GetBestSellerBooksError({required this.errorMassage});
}
