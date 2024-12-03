import 'package:anetv/featuers/home/data/models/all_movies.dart';
import 'package:anetv/featuers/home/data/repo/all_movies_home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'all_movies_state.dart';

class AllMoviesCubit extends Cubit<AllMoviesState> {
  AllMoviesCubit(this.allMoviesHomeRepo) : super(AllMoviesInitial());

  final AllMoviesHomeRepo allMoviesHomeRepo;

  Future<void> fetchAllMovies() async {
    emit(AllMoviesLoading());
    var result = await allMoviesHomeRepo.fetchAllMonies();
    result.fold((failure) {
      emit(AllMoviesFailure(failure.errorMessage));
    }, (allMovies) {
      emit(AllMoviesSuccess(allMovies));
    });
  }
}
