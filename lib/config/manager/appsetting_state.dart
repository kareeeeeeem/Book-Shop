part of 'appsetting_cubit.dart';

sealed class AppsettingState extends Equatable {
  const AppsettingState();

  @override
  List<Object> get props => [];
}

final class AppsettingInitial extends AppsettingState {}

final class AppsettingEnterNetConnected extends AppsettingState {}

final class AppsettingEnterNetNotConnected extends AppsettingState {}

final class AppsettingChangeLanguage extends AppsettingState {}

final class AppsettingChangeTheme extends AppsettingState {}

