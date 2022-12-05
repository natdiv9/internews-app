import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediaapp/app/core/themes/color_theme.dart';
import 'package:mediaapp/app/widgets/right_side_nav/become_writer_widget.dart';
import 'package:mediaapp/app/widgets/right_side_nav/meteo_widget.dart';
import 'package:mediaapp/app/widgets/right_side_nav/right_pub_widget.dart';
import 'package:mediaapp/app/widgets/right_side_nav/subscribe_newsletter_widget.dart';

class RightSideNavView extends GetView {
  const RightSideNavView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: ListView(
          children: const [
            RightPubWidget(),
            SizedBox(
              height: 16,
            ),
            MeteoWidget(),
            SizedBox(
              height: 16,
            ),
            BecomeWriterWidget(),
            SizedBox(
              height: 16,
            ),
            SubscribeNewsletterWidget()
          ],
        ),
      ),
    );
  }
}
