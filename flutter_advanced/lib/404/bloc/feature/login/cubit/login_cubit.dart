import 'package:flutter_advanced/404/bloc/feature/login/cubit/login_cubit_state.dart';
import 'package:flutter_advanced/404/bloc/feature/login/model/login_model.dart';
import 'package:flutter_advanced/404/bloc/feature/login/service/login_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(ILoginService loginService) : _loginService = loginService,super(LoginState());
  final ILoginService _loginService;

  Future<void> checkUser(String email,String password)async{
    emit(state.copyWith(isLoading: true,model : LoginModel(email, password)));
    final response = await _loginService.login(state.model!);
    emit(state.copyWith(isLoading: false, isSuccessful: response?.data != null));
  }
}


