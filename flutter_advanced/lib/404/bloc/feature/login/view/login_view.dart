import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _loginText = 'Login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        child: Padding(
          padding: PagePadding.all(),
          child: Column(
            children: [
              Padding(
                padding: PagePadding.bottom(),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email'
                  ),
                ),
              ),
              Padding(
                padding: PagePadding.bottom(),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Password'
                  ),
                  validator: (String? data) => RegExp(RegexConst),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: ElevatedButton(
                    onPressed: (){},
                    child: Text(_loginText)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PagePadding extends EdgeInsets{
  PagePadding.all() : super.all(20);
  PagePadding.bottom() : super.only(bottom: 10);
}