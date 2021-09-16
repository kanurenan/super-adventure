import 'package:get/get.dart';
import 'package:mega_commons/mega_commons.dart';

import '../../../data/providers/pay_cards_provider.dart';
import '../controllers/pay_cards_controller.dart';

class PayCardsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RestClientDio>(
      () => RestClientDio(RestClientDio.getBaseUrl().baseUrl),
    );

    Get.lazyPut<PayCardsProvider>(
      () => PayCardsProvider(
        restClientDio: Get.find(),
      ),
    );
    Get.put<PayCardsController>(
      PayCardsController(
        payCardsProvider: Get.find(),
      ),
    );
  }
}
