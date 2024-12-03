import 'package:anetv/core/utils/app_router.dart';
import 'package:anetv/core/utils/assets.dart';
import 'package:anetv/featuers/home/data/models/catogry_itme_model.dart';
import 'package:anetv/featuers/home/presentation/views/widgets/catogry_itme_home.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ListCatogryItmeHome extends StatefulWidget {
  const ListCatogryItmeHome({super.key});

  @override
  State<ListCatogryItmeHome> createState() => _ListCatogryItmeHomeState();
}

class _ListCatogryItmeHomeState extends State<ListCatogryItmeHome> {
  List<CatogryItmeModel> listCatogry = [
    CatogryItmeModel(image: AssetsData.allMovies, title: 'All'),
    CatogryItmeModel(image: AssetsData.movies, title: 'Movies'),
    CatogryItmeModel(image: AssetsData.christmas2024, title: 'Christmas 2024'),
    CatogryItmeModel(image: AssetsData.arabicMovies, title: 'افلام عربيه'),
    CatogryItmeModel(image: AssetsData.movTvSeriesies, title: 'Tv-series'),
    CatogryItmeModel(image: AssetsData.kidsFamily, title: 'Kids & Family'),
    CatogryItmeModel(image: AssetsData.translatedTurkishSeries, title: 'مسلسلات تركية مترجمة'),
    CatogryItmeModel(image: AssetsData.dubbedTurkishSeries, title: 'مسلسلات تركية مدبلجة'),
    CatogryItmeModel(image: AssetsData.arabicSeries, title: 'مسلسلات عربية'),
    CatogryItmeModel(image: AssetsData.cartoonDubbed, title: 'كرتون مدبلج'),
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width,
      height: height,
      child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: listCatogry.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                GoRouter.of(context).push(AppRouter.kSearchView);
              },
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 10,
                ),
                child: CatogryItmeHome(
                  images: listCatogry[index].image,
                  title: listCatogry[index].title,
                ),
              ),
            );
          }),
    );
  }
}
// width: width * .9,
//       height: height * .25,