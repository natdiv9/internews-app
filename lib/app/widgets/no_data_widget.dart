import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/themes/color_theme.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          SvgPicture.asset(
            'assets/images/no_data.svg',
            width: 200,
            height: 200,
          ),
          const SizedBox(
            height: 16,
          ),
          Text('Aucune donnée disponible',
              style: TextStyle(
                  color: AppColorTheme.textColor.withOpacity(0.60),
                  fontSize: 18,
                  fontWeight: FontWeight.w500))
        ],
      ),
    );
  }
}
