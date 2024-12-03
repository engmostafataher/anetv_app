
import 'package:anetv/core/utils/styels.dart';
import 'package:anetv/featuers/search/presentation/view/widget/custom_search_text_field.dart';
import 'package:anetv/featuers/search/presentation/view/widget/search_result_list_view.dart';
import 'package:flutter/material.dart';


class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSearchTextField(),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Search Result',
                  style: Styels.textStyle18,
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
        SliverFillRemaining(
          child: Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: SizedBox(),
          )),
        )
      ],
    );
  }
}
