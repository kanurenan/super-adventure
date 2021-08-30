import 'package:get/get.dart';
import 'package:mega_commons/shared/helpers/custom_dio/rest_client_dio.dart';
import 'package:mega_features/app/data/providers/login_provider.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  final String _homeRoute;

  LoginBinding({required String homeRoute}) : _homeRoute = homeRoute;

  @override
  void dependencies() {
    Get.lazyPut<RestClientDio>(
      () => RestClientDio.noAuth(RestClientDio.getBaseUrl().baseUrl),
    );

    Get.lazyPut<LoginProvider>(() => LoginProvider(restClientDio: Get.find()));

    Get.lazyPut<LoginController>(
      () => LoginController(
        loginProvider: Get.find(),
        homeRoute: _homeRoute,
      ),
    );
  }
}
