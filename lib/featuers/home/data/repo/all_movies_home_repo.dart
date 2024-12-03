import 'package:anetv/core/errors/failures.dart';
import 'package:anetv/featuers/home/data/models/all_movies.dart';
import 'package:dartz/dartz.dart';

abstract class AllMoviesHomeRepo {
 Future<Either<Failures,List<AllMovies>>>fetchAllMonies();

  
}