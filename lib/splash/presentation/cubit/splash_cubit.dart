import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());
  final networkInfo = InternetConnectionChecker();
  void checkInternetConnection() async {
    emit(SplashLoading());

    if (await networkInfo.hasConnection) {
      await Future.delayed(const Duration(seconds: 2));
      emit(SplashLoaded());
    } else {
      emit(SplashNoInternet());
    }
  }
}
