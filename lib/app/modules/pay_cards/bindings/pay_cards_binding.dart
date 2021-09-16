import 'package:get/get.dart';

import '../controllers/pay_cards_controller.dart';

class PayCardsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PayCardsController>(
      PayCardsController(),
    );
  }
}
