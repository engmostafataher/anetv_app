import 'package:anetv/core/utils/styels.dart';
import 'package:anetv/featuers/home/presentation/manager/all_movies_cubit/all_movies_cubit.dart';
import 'package:anetv/featuers/search/presentation/view/widget/custom_search_text_field.dart';
import 'package:anetv/featuers/search/presentation/view/widget/moves_list_tv.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'moves_list.dart';

class SearchViewBodyTv extends StatefulWidget {
  const SearchViewBodyTv({
    super.key,
    required this.catogry,
  });

  final String catogry;

  @override
  State<SearchViewBodyTv> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBodyTv> {
  @override
  void initState() {
    BlocProvider.of<AllMoviesCubit>(context)
        .fetchMovie(catogry: widget.catogry);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomSearchTextField(),
                const SizedBox(height: 16),
                const Text(
                  'Search Result',
                  style: Styels.textStyle18,
                ),
                const SizedBox(height: 16),
                Text(
                  widget.catogry,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
         const SliverFillRemaining(
          child: MovesListTv(),
        ),
      ],
    );
  }
}
