import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_with_mvvm/src/Utils/genral/util.dart';

import '../../Resource/components/round_button.dart';
import '../../model/auth_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    _obsecurePassword.dispose();
  
  }

  @override
  Widget build(BuildContext context) {
    final authViewMode = Provider.of<AuthviewModel>(context);

    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              focusNode: emailFocusNode,
              decoration: const InputDecoration(
                  hintText: 'Email',
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.alternate_email)),
              onFieldSubmitted: (valu) {
                Utils.fieldFocusChange(
                    context, emailFocusNode, passwordFocusNode);
              },
            ),
            ValueListenableBuilder(
                valueListenable: _obsecurePassword,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: _passwordController,
                    obscureText: _obsecurePassword.value,
                    focusNode: passwordFocusNode,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                      hintText: 'Password',
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.lock_open_rounded),
                      suffixIcon: InkWell(
                          onTap: () {
                            _obsecurePassword.value = !_obsecurePassword.value;
                          },
                          child: Icon(_obsecurePassword.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility)),
                    ),
                  );
                }),
            SizedBox(
              height: height * .085,
            ),
            RoundButton(
              title: 'Login',
              //  loading: authViewMode.loading,
              onPress: () {
                if (_emailController.text.isEmpty) {
                  Utils.flushBarErrorMessage(
                      message: 'Please enter email', context: context);
                } else if (_passwordController.text.isEmpty) {
                  Utils.flushBarErrorMessage(
                      message: 'Please enter password', context: context);
                } else if (_passwordController.text.length < 6) {
                  Utils.flushBarErrorMessage(
                      message: 'Please enter 6 digit password',
                      context: context);
                } else {
                  // Map data = {
                  //   'email': _emailController.text.toString(),
                  //   'password': _passwordController.text.toString(),
                  // };

                  Map data = {
                    'email': 'eve.holt@reqres.in',
                    'password': 'cityslicka',
                  };

                  authViewMode.loginApi(context: context, data: data);
                  // print('api hit');
                }
              },
            ),
            SizedBox(
              height: height * .02,
            ),
            InkWell(
                onTap: () {
                  // Navigator.pushNamed(context, RoutesName.signUp);
                },
                child: const Text("Don't have an accont? Sign Up"))
          ],
        ),
      ),
    );
  }
}
