import 'package:anetv/core/utils/assets.dart';
import 'package:anetv/featuers/home/data/models/catogry_itme_model.dart';
import 'package:anetv/featuers/home/presentation/views/widgets/catogry_itme_home.dart';
import 'package:flutter/material.dart';

class SearchResultListView extends StatefulWidget {
  const SearchResultListView({super.key});

  @override
  State<SearchResultListView> createState() => _SearchResultListViewState();
}

class _SearchResultListViewState extends State<SearchResultListView> {
    List<CatogryItmeModel> listCatogry = [
    CatogryItmeModel(image: AssetsData.testImage, title: 'All'),
    CatogryItmeModel(image: AssetsData.testImage, title: 'Movies'),
    CatogryItmeModel(image: AssetsData.testImage, title: 'Christmas 2024'),
    CatogryItmeModel(image: AssetsData.testImage, title: 'افلام عربيه'),
    CatogryItmeModel(image: AssetsData.testImage, title: 'Tv-series'),
    CatogryItmeModel(image: AssetsData.testImage, title: 'Kids & Family'),
    CatogryItmeModel(image: AssetsData.testImage, title: 'مسلسلات تركية مترجمة'),
    CatogryItmeModel(image: AssetsData.testImage, title: 'مسلسلات تركية مدبلجة'),
    CatogryItmeModel(image: AssetsData.testImage, title: 'مسلسلات عربية'),
    CatogryItmeModel(image: AssetsData.testImage, title: 'كرتون مدبلج'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: 10,
        itemBuilder: (context, index) {
          return  Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: CatogryItmeHome(
              images: listCatogry[index].image,
              title: listCatogry[index].title,
            ),
          );
        });
  }
}
