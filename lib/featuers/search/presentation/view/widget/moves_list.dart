import 'package:anetv/core/utils/app_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../home/presentation/manager/all_movies_cubit/all_movies_cubit.dart';

class MovesList extends StatelessWidget {
  const MovesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllMoviesCubit, AllMoviesState>(
        builder: (context, state) {
      if (state is AllMoviesSuccess) {
        final allMoves = state.allMovies;
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: allMoves.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
            child: Column(
              children: [
                Text(
                  allMoves[index].title,
                  style: const TextStyle(fontSize: 20),
                ),
                InkWell(
                  onTap: () {
                    GoRouter.of(context).push(
                      AppRouter.kWatchingMovieView,
                      extra: allMoves[index].embedLink,
                    );
                  },
                  child: CachedNetworkImage(
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.fill,
                    imageUrl: '${allMoves[index].thumbnail}',
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                  ),
                )
              ],
            ),
          ),
        );
      } else if (state is AllMoviesFailure) {
        print(state.errorMassage);
        return Text(state.errorMassage);
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
