import 'package:anetv/featuers/home/presentation/views/widgets/adaptive_layout.dart';
import 'package:anetv/featuers/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: AdaptiveLayout(
        mobileLayout: (context) => const HomeViewBody(),
        tabletLayout: (context) => const SizedBox(),
        desktopLayout: (context) => const SizedBox(),
      ),
    );
  }
}