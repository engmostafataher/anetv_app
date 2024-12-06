import 'package:anetv/constants.dart';
import 'package:anetv/core/utils/app_router.dart';
import 'package:anetv/core/utils/service_locator.dart';
import 'package:anetv/featuers/home/data/repo/all_movies_home_repo_impl.dart';
import 'package:anetv/featuers/home/presentation/manager/all_movies_cubit/all_movies_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  setup();
  runApp(Builder(builder: (context) {
    return EasyLocalization(
        path: 'assets/translations',
        supportedLocales: const [
          Locale(
            'en',
          ),
          Locale(
            'ar',
          ),
        ],
        fallbackLocale: const Locale('en', 'US'),
        child: const MyApp());
  }));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllMoviesCubit(getIt.get<AllMoviesHomeRepoImpl>()),
      child: MaterialApp.router(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        routerConfig: AppRouter.router,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
} 


// kids_family