import 'package:anetv/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../home/presentation/manager/all_movies_cubit/all_movies_cubit.dart';

class MovesListTv extends StatelessWidget {
  const MovesListTv({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllMoviesCubit, AllMoviesState>(
        builder: (context, state) {
      if (state is AllMoviesSuccess) {
        final allMoves = state.allMovies;
        return GridView.builder(
          itemCount: allMoves.length,
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,  // يعرض 3 أعمدة في الشاشة
          crossAxisSpacing: 10,  // المسافة بين الأعمدة
          mainAxisSpacing: 10,   // المسافة بين الصفوف
          childAspectRatio: 1.0, // نسبة العرض إلى الارتفاع للعناصر
        )
        , itemBuilder: (context,index){

            return  Padding(
                padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
                child: Column(
                  children: [
                    Text(
                      allMoves[index].title,
                      style: const TextStyle(fontSize: 20),
                    ),
                    InkWell(
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.kWatchingMovieView,
                            extra: allMoves[index].embedLink);
                      },
                      child: Image.network(
                        height: 150,
                        width: double.infinity,
                        '${allMoves[index].thumbnail}',
                        fit: BoxFit.fill,
                      ),
                    )
                  ],
                ),
              );
            });
      } else if (state is AllMoviesFailure) {
        print(state.errorMassage);
        return Text(state.errorMassage);
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
