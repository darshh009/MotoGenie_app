import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
class RazorPayService {

  final Razorpay _razorpay = Razorpay();
  late final BuildContext context;

  RazorPayService({required this.context}) {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }


  void openCheckout(
      {required int amount, required String planName}) {
    var options = {
      'key': 'rzp_test_Sj8tIwL2VRqKTz',
      'amount': amount * 100,
      'name': 'MotoGenie Pvt.Ltd.',
      'description': '$planName Plan',
      'prefill': {
        'contact': '8888888888',
        'email': 'test@razorpay.com',
      },
      'method': {
        'upi': true,
        'card': true,
        'netbanking': false,
      },
    };

    _razorpay.open(options);

  }



  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Payment Successful",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),),
            backgroundColor: Colors.green.shade500,
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 2)
        ));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Payment Failed",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 2)
        ));
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print("EXTERNAL WALLET: ${response.walletName}");
  }

  void dispose() {
    _razorpay.clear();
  }
}

