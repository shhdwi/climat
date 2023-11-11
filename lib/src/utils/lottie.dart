import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieDisplayWidget extends StatelessWidget {
  final String lottieAsset;
  final double width;
  final double height;

  const LottieDisplayWidget({
    Key? key,
    required this.lottieAsset,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      lottieAsset,
      width: width,
      height: height,
      fit: BoxFit.fill,
    );
  }
}
