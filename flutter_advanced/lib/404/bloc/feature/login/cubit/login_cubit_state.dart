import 'package:equatable/equatable.dart';
import 'package:flutter_advanced/404/bloc/feature/login/model/login_model.dart';
import 'package:flutter_advanced/product/model/token_model.dart';

class LoginState extends Equatable {

  final bool isLoading;
  final LoginModel? model;
  final TokenModel? tokenModel;
  final bool isSuccessful;
  LoginState({this.isLoading = false,this.model,this.tokenModel,this.isSuccessful = false}); // default value

  @override
  List<Object?> get props => [isLoading,model]; // the page is not triggered unless isLoading and model changes

  LoginState copyWith({ // copyWith : if the value is sent it gets that value, if the value is not sent it gets the latest value
    bool? isLoading,
    LoginModel? model,
    TokenModel? tokenModel,
    bool? isSuccessful
  }) {
    return LoginState(
      isLoading: isLoading ?? false,
      model: model ?? this.model,
      tokenModel: tokenModel ?? this.tokenModel,
      isSuccessful: isSuccessful ?? false,
    );
  }

}

