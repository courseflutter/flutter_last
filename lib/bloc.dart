import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_last/dio_service.dart';
import 'package:flutter_last/model.dart';
import 'package:flutter_last/states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitState());
  AppCubit get(context) => BlocProvider.of(context);
  UserData? userData;
  login(String email, String password) {
    emit(AppLoginLoadingState());
    DioHelper.postData(
        path: 'login',
        data: {'email': '$email', 'password': '$password'}).then((value) {
      userData = UserData.fromJson(value?.data);
      print(userData?.data?.token);
      emit(AppLoginSucceedState());
    }).catchError((error) {
      print(error.toString());
      emit(AppLoginErrorState());
    });
  }
}
