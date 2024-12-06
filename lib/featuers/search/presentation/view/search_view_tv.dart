import 'package:anetv/featuers/search/presentation/view/widget/search_view_body_tv.dart';
import 'package:flutter/material.dart';

class SearchViewTv extends StatelessWidget {
  const SearchViewTv({
    super.key, required this.catogry,
  });
  final String catogry;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SearchViewBodyTv(
        catogry: catogry,
      )
      ),
    );
  }
}
