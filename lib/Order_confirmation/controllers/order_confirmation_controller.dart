import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../cart_page/controllers/cart_page_controller.dart';

class OrderConfirmationController extends GetxController {
  final cartcontroller = Get.put(CartPageController());
  late Razorpay _razorpay;
  int pyment = 0;

  void pymentstoring(int totel) {
    this.pyment = pyment;
  }

  @override
  void onInit() {
    super.onInit();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  }

  void calltheapi() {
    var options = {
      'key': 'rzp_test_skEz4bIrfT5GkV',
      'amount': cartcontroller.totelpyment,
      'name': 'Acme Corp.',
      'description': 'Fine T-Shirt',
      'timeout': 60, // in seconds
      'prefill': {'contact': '9123456789', 'email': 'gaurav.kumar@example.com'}
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    print("dsd");
  }

  void handlePaymentError(PaymentFailureResponse response) {
    print("faid");
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    print("hello");
  }

  @override
  void dispose() {
    super.dispose();
    // _razorpay.clear();
  }
}
