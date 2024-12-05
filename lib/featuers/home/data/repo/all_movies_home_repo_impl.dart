import 'package:anetv/core/errors/failures.dart';
import 'package:anetv/core/utils/api_service.dart';
import 'package:anetv/featuers/home/data/models/movie_model.dart';
import 'package:anetv/featuers/home/data/repo/all_movies_home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AllMoviesHomeRepoImpl implements AllMoviesHomeRepo {
  final ApiService apiService;

  const AllMoviesHomeRepoImpl(this.apiService);
  final String baseUrlAllMovies = 'https://alaanetstreaming.com/';
  String feachMovies({required String catogry}) {
    return '${baseUrlAllMovies}v_v/?category=$catogry&type=movie';
  }

  @override
  Future<Either<Failures, List<MovieModel>>> fetchMovie(
      {required String catogry}) async {
    try {
      var data = await apiService.get(apis: feachMovies(catogry: catogry));
      //print('API Response: $data');
      List<MovieModel> movie = [];
      for (var i in data['videos']) {
        movie.add(MovieModel.fromJson(i));
      }
      print('Movie List: $movie');
      return right(movie);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailuer.fromDioException(e));
      }
      return left(ServerFailuer(e.toString()));
    }
  }
}

// https://alaanetstreaming.com/v_v/
