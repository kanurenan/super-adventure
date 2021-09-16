import 'package:get/get.dart';
import 'package:mega_commons/shared/helpers/custom_dio/rest_client_dio.dart';

import '../../../../mega_features.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RestClientDio>(
      () => RestClientDio(RestClientDio.getBaseUrl().baseUrl),
    );

    Get.lazyPut<ForgotPasswordProvider>(
      () => ForgotPasswordProvider(
        restClientDio: Get.find(),
      ),
    );

    Get.lazyPut<ForgotPasswordController>(
      () => ForgotPasswordController(
        forgotPasswordProvider: Get.find(),
      ),
    );
  }
}
