import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import 'package:mediaapp/app/core/themes/color_theme.dart';

import 'package:flutter_map/flutter_map.dart'; // Suitable for most situations
import 'package:flutter_map/plugin_api.dart'; // Only import if required functionality is not exposed by default

import 'controllers/enrollment_centers.controller.dart';

class DesktopEnrollmentCentersScreen
    extends GetView<EnrollmentCentersController> {
  const DesktopEnrollmentCentersScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: ListView(children: [
          Text(
            "Centre d\'enrollement",
            style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                    color: AppColorTheme.textColor,
                    fontSize: 26,
                    fontWeight: FontWeight.bold)),
          ),
          const SizedBox(
            height: 24,
          ),
          Container(
            height: 250,
            decoration: BoxDecoration(
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
            child: FlutterMap(
              options: MapOptions(
                center: LatLng(-11.663054, 27.483564),
                zoom: 9.2,
              ),
              nonRotatedChildren: [
                AttributionWidget.defaultWidget(
                  source: 'OpenStreetMap contributors',
                  onSourceTapped: null,
                ),
              ],
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
              ],
            ),
          )
        ]));
  }
}
