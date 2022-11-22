import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mediaapp/app/widgets/views/news_item_card_view.dart';

class RecentNewsView extends GetView {
  const RecentNewsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        NewsItemCardView(),
        SizedBox(
          height: 16,
        ),
        NewsItemCardView(),
        SizedBox(
          height: 16,
        ),
        NewsItemCardView(),
      ],
    );
  }
}
