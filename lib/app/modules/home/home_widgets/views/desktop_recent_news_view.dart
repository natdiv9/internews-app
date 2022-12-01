import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mediaapp/app/data/models/news_model.dart';
import 'package:mediaapp/app/widgets/news_card/desktop_news_item_card_view.dart';

class DesktopRecentNewsView extends GetView {
  const DesktopRecentNewsView({
    Key? key,
    required this.newsList,
  }) : super(key: key);
  final List<NewsData> newsList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              DesktopNewsItemCardView(
                newsData: newsList[index],
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          );
        });
  }
}
