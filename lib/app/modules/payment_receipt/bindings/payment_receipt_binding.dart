import 'package:get/get.dart';

import '../controllers/payment_receipt_controller.dart';

class PaymentReceiptBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentReceiptController>(
      () => PaymentReceiptController(),
    );
  }
}
