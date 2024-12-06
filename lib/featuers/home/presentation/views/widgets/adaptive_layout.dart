import 'package:flutter/material.dart';

class AdaptiveLayout
 extends StatelessWidget {
  const AdaptiveLayout
  ({super.key, required this.mobileLayout, required this.desktopLayout});
    final WidgetBuilder mobileLayout, desktopLayout;


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      if (constrains.maxWidth < 600) {
        return mobileLayout(context);
      }  else {
        return desktopLayout(context);
      }
    });
  }
}