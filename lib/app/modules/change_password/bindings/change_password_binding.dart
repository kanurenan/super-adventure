import 'package:get/get.dart';
import 'package:mega_commons/mega_commons.dart';
import 'package:mega_features/app/data/providers/change_password_provider.dart';

import '../controllers/change_password_controller.dart';

class ChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RestClientDio>(
      () => RestClientDio(RestClientDio.getBaseUrl().baseUrl),
    );

    Get.lazyPut<ChangePasswordProvider>(
      () => ChangePasswordProvider(
        restClientDio: Get.find(),
      ),
    );

    Get.lazyPut<ChangePasswordController>(
      () => ChangePasswordController(
        changePasswordProvider: Get.find(),
      ),
    );
  }
}
