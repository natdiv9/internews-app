import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediaapp/app/core/themes/color_theme.dart';

class SubscribeNewsletterWidget extends StatelessWidget {
  const SubscribeNewsletterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color: AppColorTheme.darkColor.withOpacity(0.04),
                    blurRadius: 20,
                    offset: const Offset(0, 2),
                  ),
                ],
                color: AppColorTheme.whiteColor,
              ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Text(
            'Abonnez-vous à notre newsletter',
            style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                    color: AppColorTheme.textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.normal)),
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 38,
            child: TextField(
              decoration: InputDecoration(
                  labelText: 'Entrer votre email',
                  labelStyle: TextStyle(
                      color: AppColorTheme.textColor.withOpacity(0.3),
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColorTheme.textColor, width: 0.1),
                      borderRadius: BorderRadius.all(Radius.circular(4)))),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            width: double.infinity,
            height: 38,
            child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    foregroundColor: AppColorTheme.darkColor.withOpacity(1),
                    backgroundColor: AppColorTheme.primaryColor),
                child: Container(
                  child: Text('S’inscrire',
                      style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                              color: AppColorTheme.whiteColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w400))),
                )),
          ),
          const SizedBox(
            height: 24,
          ),
        ]),
      ),
    );
  }
}
