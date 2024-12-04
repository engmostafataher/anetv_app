
import 'package:anetv/featuers/home/data/models/movie_model.dart';
import 'package:anetv/featuers/home/presentation/views/home_view.dart';
import 'package:anetv/featuers/search/presentation/view/search_view.dart';
import 'package:anetv/featuers/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';

  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: kSearchView,
      builder: (context, state) => SearchView(
        catogry: state.extra as dynamic,
      ),
    ),
    GoRoute(
      path: kHomeView,
      builder: (context, state) => const HomeView(),
    ),
    // GoRoute(
    //   path: kBookDetailsView,
    //   builder: (context, state) => const BookDetailsView(),
    // )
  ]);
}
