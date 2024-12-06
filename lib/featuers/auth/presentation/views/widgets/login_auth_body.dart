import 'package:anetv/core/utils/app_router.dart';
import 'package:anetv/core/utils/styels.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginAuthBody extends StatefulWidget {
  const LoginAuthBody({super.key});

  @override
  State<LoginAuthBody> createState() => _LoginAuthBodyState();
}

class _LoginAuthBodyState extends State<LoginAuthBody> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
              onPressed: () {
                if (context.locale.languageCode == 'en') {
                  context.setLocale(const Locale('ar'));
                } else {
                  context.setLocale(const Locale('en'));
                }
              },
              icon: const Icon(Icons.language)),
          const Spacer(),
          const Center(
            child: Icon(
              Icons.lock_outline,
              size: 80,
              color: Color.fromARGB(255, 165, 192, 134),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              context.tr('CreateANewAccount'),
              style: Styels.textStyle20.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              context.tr('TitleAuth'),
              textAlign: TextAlign.center,
              style: Styels.textStyle14.copyWith(color: Colors.grey),
            ),
          ),
          const SizedBox(height: 30),
          TextField(
            keyboardType: TextInputType.emailAddress,
            obscureText: isPasswordVisible,
            decoration: InputDecoration(
              labelText: context.tr('Email'),
              prefixIcon: const Icon(Icons.email),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            keyboardType: TextInputType.emailAddress,
            obscureText: isPasswordVisible,
            decoration: InputDecoration(
              labelText: context.tr('Password'),
              prefixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                  icon: isPasswordVisible
                      ? const Icon(Icons.lock_open_outlined)
                      : const Icon(Icons.lock)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 165, 192, 134),
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kHomeView);
              },
              child: Text(
                context.tr('Welcome'),
                style: Styels.textStyle16.copyWith(color: Colors.white),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
