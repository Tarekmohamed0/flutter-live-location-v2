part of 'splash_cubit.dart';

abstract class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

class SplashInitial extends SplashState {}

class SplashLoading extends SplashState {}

class SplashLoaded extends SplashState {}

class SplashError extends SplashState {}

class SplashNoInternet extends SplashState {}

class SplashNoData extends SplashState {}
