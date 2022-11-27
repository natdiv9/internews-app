import 'package:get/get.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    // GetPage(
    //   name: _Paths.NEWS_DETAILS,
    //   page: () => const NewsDetailsView(),
    //   binding: NewsDetailsBinding(),
    //   children: [
    //     GetPage(
    //       name: _Paths.NEWS_DETAILS,
    //       page: () => const NewsDetailsView(),
    //       binding: NewsDetailsBinding(),
    //     ),
    //   ],
    // ),
    // GetPage(
    //   name: _Paths.CANDIDATS_DETAILS,
    //   page: () => const CandidatsDetailsView(),
    //   binding: CandidatsDetailsBinding(),
    // ),
  ];
}
