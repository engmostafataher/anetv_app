import 'package:anetv/featuers/home/presentation/views/widgets/list_catogry_itme_home_tv.dart';
import 'package:flutter/material.dart';

class HomeViewBodyTv
 extends StatelessWidget {
  const HomeViewBodyTv
  ({super.key});

  @override
  Widget build(BuildContext context) {
    return  const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              ListCatogryItmeHomeTv()
            ],
          ),
        ),
      ],
    );
  }
}