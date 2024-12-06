import 'package:flutter/material.dart';


import 'widget/watching_movie_view_body.dart';

class WatchingMovieView extends StatelessWidget {
  const WatchingMovieView({super.key, required this.url});
  final String url;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: WatchingMovieViewBody(url: url)),
    );
  }
}
