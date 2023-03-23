import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import 'package:mediaapp/app/core/themes/color_theme.dart';
import 'package:mediaapp/app/widgets/news_card_shimmer.dart';

import 'controllers/enrollment_centers.controller.dart';

class MobileEnrollmentCentersScreen
    extends GetView<EnrollmentCentersController> {
  MobileEnrollmentCentersScreen({Key? key}) : super(key: key);

  EnrollmentCentersController controller =
      Get.put(EnrollmentCentersController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Obx(() {
        return (controller.centresData.length > 0)
            ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  height: 300,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColorTheme.darkColor.withOpacity(0.04),
                        blurRadius: 20,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: FlutterMap(
                    options: MapOptions(
                      center: LatLng(-11.663054, 27.483564),
                      zoom: 11.2,
                      keepAlive: true,
                    ),
                    nonRotatedChildren: [
                      // AttributionWidget.defaultWidget(
                      //   source: 'OpenStreetMap contributors',
                      //   onSourceTapped: null,
                      // ),
                    ],
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.example.app',
                        errorImage: const NetworkImage(
                            'https://tile.openstreetmap.org/18/0/0.png'),
                      ),
                      MarkerLayer(
                        markers: [
                          Marker(
                            point:
                                LatLng(-11.641847812085455, 27.406655102042084),
                            width: 80,
                            height: 80,
                            builder: (context) => Icon(
                              Icons.location_pin,
                              color: Colors.red,
                            ),
                          ),
                          Marker(
                            point:
                                LatLng(-11.657267236998631, 27.486194449867426),
                            width: 80,
                            height: 80,
                            builder: (context) => Icon(
                              Icons.location_pin,
                              color: Colors.red,
                            ),
                          ),
                          Marker(
                            point:
                                LatLng(-11.65486099972942, 27.50198729637693),
                            width: 80,
                            height: 80,
                            builder: (context) => Icon(
                              Icons.location_pin,
                              color: Colors.red,
                            ),
                          ),
                          Marker(
                            point:
                                LatLng(-11.638046291686848, 27.439968645987435),
                            width: 80,
                            height: 80,
                            builder: (context) => Icon(
                              Icons.location_pin,
                              color: Colors.red,
                            ),
                          ),
                          Marker(
                            point:
                                LatLng(-11.612489012304724, 27.39765411678915),
                            width: 80,
                            height: 80,
                            builder: (context) => Icon(
                              Icons.location_pin,
                              color: Colors.red,
                            ),
                          ),
                          Marker(
                            point:
                                LatLng(-11.650782020388183, 27.36619717039618),
                            width: 80,
                            height: 80,
                            builder: (context) => Icon(
                              Icons.location_pin,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Centre d\'enrollement",
                    style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                            color: AppColorTheme.textColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ListView.builder(
                      itemCount: controller.centresData.length,
                      // scrollDirection: Axis.vertical,
                      primary: false,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: AppColorTheme.whiteColor,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    AppColorTheme.darkColor.withOpacity(0.04),
                                blurRadius: 20,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  controller.centresData[index].designation!,
                                  style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                          color: AppColorTheme.textColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                )
              ])
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: NewsCardShimmerWidget(),
              );
      }),
    );
  }
}
