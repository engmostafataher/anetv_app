import 'package:anetv/core/utils/app_router.dart';
import 'package:anetv/core/utils/assets.dart';
import 'package:anetv/featuers/home/data/models/catogry_itme_model.dart';
import 'package:anetv/featuers/home/presentation/views/widgets/catogry_itme_home.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ListCatogryItmeHomeTv extends StatefulWidget {
  const ListCatogryItmeHomeTv({super.key});

  @override
  State<ListCatogryItmeHomeTv> createState() => _ListCatogryItmeHomeTvState();
}

class _ListCatogryItmeHomeTvState extends State<ListCatogryItmeHomeTv> {
  List<CatogryItmeModel> listCatogry = [
    CatogryItmeModel(
        image: AssetsData.movies, title: 'All Movies', catogry: 'movies'),
    CatogryItmeModel(
        image: AssetsData.christmas2024,
        title: 'Christmas 2024',
        catogry: 'Christmas-Movies-2024'),
    CatogryItmeModel(
        image: AssetsData.arabicMovies,
        title: 'افلام عربيه',
        catogry: 'افلام%20عربي'),
    CatogryItmeModel(
        image: AssetsData.movTvSeriesies,
        title: 'Tv-series',
        catogry: 'tv-series'),
    CatogryItmeModel(
        image: AssetsData.kidsFamily,
        title: 'Kids & Family',
        catogry: 'Kids%20-%20Family'),
    CatogryItmeModel(
        image: AssetsData.translatedTurkishSeries,
        title: 'مسلسلات تركية مترجمة',
        catogry: 'تركي-مترجم'),
    CatogryItmeModel(
        image: AssetsData.dubbedTurkishSeries,
        title: 'مسلسلات تركية مدبلجة',
        catogry: 'تركي-مدبلج'),
    CatogryItmeModel(
        image: AssetsData.arabicSeries,
        title: 'مسلسلات عربية',
        catogry: 'مسلسلات-عربية'),
    CatogryItmeModel(
        image: AssetsData.cartoonDubbed,
        title: 'كرتون مدبلج',
        catogry: 'رسوم-اطفال-مدبلجة'),
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width,
      height: height,
      child: GridView.builder(
          itemCount: listCatogry.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, // يعرض 3 أعمدة في الشاشة
            crossAxisSpacing: 10, // المسافة بين الأعمدة
            mainAxisSpacing: 10, // المسافة بين الصفوف
            childAspectRatio: 1.0, // نسبة العرض إلى الارتفاع للعناصر
          ),
          itemBuilder: (context,index){
            return InkWell(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kSearchViewTv,
                      extra: listCatogry[index].catogry);
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
