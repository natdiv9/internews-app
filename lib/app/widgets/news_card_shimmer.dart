import 'package:flutter/material.dart';
import 'package:mediaapp/app/core/themes/color_theme.dart';
import 'package:shimmer/shimmer.dart';

class NewsCardShimmerWidget extends StatelessWidget {
  const NewsCardShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: _buildShimmer(),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 200,
              child: _buildShimmer(),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 200,
              child: _buildShimmer(),
            ),
          ],
        ),
      ),
    );
  }

  Shimmer _buildShimmer() {
    return Shimmer.fromColors(
      baseColor: AppColorTheme.primaryColor.withOpacity(0.05),
      highlightColor: AppColorTheme.backgroundColor,
      direction: ShimmerDirection.ltr,
      period: const Duration(milliseconds: 5000),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.white54),
      ),
    );
  }
}
