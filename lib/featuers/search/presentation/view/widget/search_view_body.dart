import 'package:anetv/core/utils/styels.dart';
import 'package:anetv/featuers/home/data/models/movie_model.dart';
import 'package:anetv/featuers/home/presentation/manager/all_movies_cubit/all_movies_cubit.dart';
import 'package:anetv/featuers/search/presentation/view/widget/custom_search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({
    super.key,
    required this.catogry,
  });

  final MovieModel catogry;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomSearchTextField(),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Search Result',
                  style: Styels.textStyle18,
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
        // SliverFillRemaining(
        //   child: Expanded(
        //     child: ListView.builder(
        //         itemCount: catogry.length,
        //         itemBuilder: (context, index) {
        //           return Text('${catogry[index].title}');
        //         }),
        //   ),
        // )
      ],
    );
  }
}
