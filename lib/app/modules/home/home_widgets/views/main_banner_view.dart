import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediaapp/app/core/themes/color_theme.dart';

class MainBannerView extends GetView {
  const MainBannerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.40,
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          image: const DecorationImage(
              image: AssetImage('assets/images/vote.jpg'), fit: BoxFit.cover)),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            color: Colors.black.withOpacity(0.6),
          ),
          Padding(
            padding: const EdgeInsets.all(64),
            child: Text(
              'Bienvenu sur le site officiel de la CENI qui vous tient informé sur toute l’actualité du processus électorale en RDC',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                      color: AppColorTheme.whiteColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w600)),
            ),
          )
        ],
      ),
    );
  }
}
