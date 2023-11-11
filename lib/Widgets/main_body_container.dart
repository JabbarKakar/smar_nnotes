import 'package:flutter/material.dart';

import '../Utils/app_images.dart';


class MainBodyContainer extends StatelessWidget {
  final Widget child;
  const MainBodyContainer({
    super.key, required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AppImages.mainBackground), fit: BoxFit.fill)
      ),
      child: child,
    );
  }
}