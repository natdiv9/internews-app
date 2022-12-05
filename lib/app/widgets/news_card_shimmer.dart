import 'package:flutter/material.dart';
import 'package:mediaapp/app/core/themes/color_theme.dart';
import 'package:shimmer/shimmer.dart';

class NewsCardShimmerWidget extends StatelessWidget {
  const NewsCardShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 250,
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.white,
              direction: ShimmerDirection.ltr,
              period: const Duration(milliseconds: 3000),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColorTheme.whiteColor,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 110,
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.white,
              direction: ShimmerDirection.ltr,
              period: const Duration(milliseconds: 3000),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColorTheme.whiteColor,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 80,
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.white,
              direction: ShimmerDirection.ltr,
              period: const Duration(milliseconds: 3000),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColorTheme.whiteColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
