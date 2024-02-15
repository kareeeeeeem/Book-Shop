part of 'get_simailer_books_cubit.dart';

sealed class GetSimailerBooksState extends Equatable {
  const GetSimailerBooksState();

  @override
  List<Object> get props => [];
}

final class GetSimailerBooksInitial extends GetSimailerBooksState {}

final class GetSimailerBooksSuccess extends GetSimailerBooksState {}

final class GetSimailerBooksLoading extends GetSimailerBooksState {}

final class GetSimailerBooksError extends GetSimailerBooksState {
  final String errorMassage;

  const GetSimailerBooksError({required this.errorMassage});
}
