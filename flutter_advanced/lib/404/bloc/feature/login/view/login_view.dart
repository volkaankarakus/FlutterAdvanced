import 'package:flutter/material.dart';
import 'package:flutter_advanced/202/image_learn_202.dart';
import 'package:flutter_advanced/404/bloc/feature/login/cubit/login_cubit.dart';
import 'package:flutter_advanced/404/bloc/feature/login/cubit/login_cubit_state.dart';
import 'package:flutter_advanced/404/bloc/feature/login/service/login_service.dart';
import 'package:flutter_advanced/404/bloc/feature/login/service/vexana_network_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:vexana/vexana.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _loginText = 'Login';
  final GlobalKey<FormState> _formLoginKey = GlobalKey();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
        create: (context) => LoginCubit(LoginService(VexanaNetworkManager())),
        child: Scaffold(
          appBar: AppBar(title:
              BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
            return state.isLoading
                ? CircularProgressIndicator(
                    color: context.colorScheme.secondary)
                : SizedBox();
          })),
          body: Form(
            autovalidateMode: AutovalidateMode.always,
            key: _formLoginKey,
            child: Padding(
              padding: PagePadding.all(),
              child: Column(
                children: [
                  _LoginEmailandPasswordField(
                      emailController: _emailController,
                      passwordController: _passwordController),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: _LoginButton(
                        formLoginKey: _formLoginKey,
                        emailController: _emailController,
                        passwordController: _passwordController,
                        loginText: _loginText),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({
    Key? key,
    required GlobalKey<FormState> formLoginKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required String loginText,
  })  : _formLoginKey = formLoginKey,
        _emailController = emailController,
        _passwordController = passwordController,
        _loginText = loginText,
        super(key: key);

  final GlobalKey<FormState> _formLoginKey;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final String _loginText;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
  listener: (context, state) {
    if(state.isSuccessful){
      context.navigateToPage(ImageLearn202());
    }
  },
  builder: (context, state) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return ElevatedButton(
            onPressed: () {
              if (_formLoginKey.currentState?.validate() ?? false) {
                context
                    .read<LoginCubit>()
                    .checkUser(_emailController.text, _passwordController.text);
              }
            },
            child: Text('$_loginText - ${state.model?.email ?? ''}'));
      },
    );
  },
);
  }
}

class _LoginEmailandPasswordField extends StatelessWidget {
  const _LoginEmailandPasswordField(
      {Key? key,
      required TextEditingController emailController,
      required TextEditingController passwordController})
      : _emailController = emailController,
        _passwordController = passwordController,
        super(key: key);

  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<LoginCubit, LoginState, bool>(
      selector: (state) {
        return state.isLoading;
      },
      builder: (context, state) {
        return IgnorePointer(
          ignoring: state,
          child: AnimatedOpacity(
            duration: context.durationLow,
            opacity: state ? 0.3 : 1,
            child: Column(
              children: [
                Padding(
                  padding: PagePadding.bottom(),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                    validator: (String? data) =>
                        (data?.isValidEmail ?? false) ? null : 'Error',
                  ),
                ),
                Padding(
                  padding: PagePadding.bottom(),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(labelText: 'Password'),
                    validator: (String? data) =>
                        ((data?.length ?? 0) > 6 ) ? null : 'Error',
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class PagePadding extends EdgeInsets {
  PagePadding.all() : super.all(20);
  PagePadding.bottom() : super.only(bottom: 10);
}
