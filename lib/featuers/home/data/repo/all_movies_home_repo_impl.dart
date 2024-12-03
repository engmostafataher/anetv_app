import 'package:anetv/core/errors/failures.dart';
import 'package:anetv/core/utils/api_service.dart';
import 'package:anetv/featuers/home/data/models/all_movies.dart';
import 'package:anetv/featuers/home/data/repo/all_movies_home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
class AllMoviesHomeRepoImpl implements AllMoviesHomeRepo {
  final ApiService apiService;

  const AllMoviesHomeRepoImpl(this.apiService);
  final String baseUrlAllMovies = 'https://alaanetstreaming.com/';
  final String endPointAllMovies = 'v_v/';
  @override
  Future<Either<Failures, List<AllMovies>>> fetchAllMonies() async {
    try {
      
      var data = await apiService.get(
          baseUrl: baseUrlAllMovies, endPoint: baseUrlAllMovies);
      List<AllMovies> allMovies = [];
      for (var i in data['videos']) {
        allMovies.add(AllMovies.fromJson(i));}
      return right(allMovies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailuer.fromDioException(e));
      }
      return left(ServerFailuer(e.toString()));
    }
  }
}



// https://alaanetstreaming.com/v_v/