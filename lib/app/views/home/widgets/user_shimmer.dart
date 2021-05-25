import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerUser extends StatelessWidget {
  final double? height;
  final double? width;

  const ShimmerUser({
    Key? key,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Color(0xFFF5F5F5),
      highlightColor: Colors.white,
      child: Container(
        height: height ?? 30,
        width: width ?? double.infinity,
        color: Colors.grey,
      ),
    );
  }
}
