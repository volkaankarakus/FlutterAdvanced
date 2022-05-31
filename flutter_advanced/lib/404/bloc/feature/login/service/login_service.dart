import 'package:flutter_advanced/404/bloc/feature/login/model/login_model.dart';
import 'package:flutter_advanced/product/model/token_model.dart';
import 'package:vexana/vexana.dart';

abstract class ILoginService{
  final INetworkManager networkManager;
  ILoginService(this.networkManager);

  Future<IResponseModel<TokenModel?>?> login(LoginModel model);
  final String _loginPath = 'api/login';
}

class LoginService extends ILoginService{
  LoginService(INetworkManager networkManager) : super(networkManager);

  @override
  Future<IResponseModel<TokenModel?>?> login(LoginModel model) async{
    return await  networkManager.send<TokenModel,TokenModel>(
        _loginPath,
        parseModel: TokenModel(),
        method: RequestType.POST,
        data: model);
  }
}