import 'package:anetv/featuers/auth/presentation/views/widgets/login_auth_body.dart';
import 'package:flutter/material.dart';

class LoginAuth
 extends StatelessWidget {
  const LoginAuth
  ({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginAuthBody(),
    );
  }
}