// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  late Map<String, dynamic> paymentIntent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Payment")),
      body: Center(
          child: TextButton(
        child: Text("Make payment"),
        onPressed: () async {
          await makePayment();
        },
      )),
    );
  }

  Future<void> makePayment() async {
    paymentIntent = await createPaymentIntent('10', 'USD');
    await Stripe.instance
        .initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
                paymentIntentClientSecret: paymentIntent['client_secret'],
                style: ThemeMode.dark,
                merchantDisplayName: 'Mirza'))
        .then((value) {});

    displayPaymentSheet();
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': '1000',
        'currency': currency,
        'payment_method_types[]': 'card'
      };
      var secretKey =
          'sk_test_51O0THdG4y19tAglhbUozI8A2XtkjuppvCEaU9Uneu6BWkyq72zAprtbhTcb18jhbDsXy7Comw42iJ4MvrBnCFh8W00XfO4s7X3';
      final headers = {
        'Authorization': 'Bearer $secretKey',
        'Content-Type': 'application/x-www-form-urlencoded',
      };
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: headers,
        body: body,
      );

      print('Payment intent body -> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (e) {
      print('desio se error ${e.toString()}');
    }
  }

  displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet().then((value) {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        ),
                        Text('Payment success')
                      ],
                    )
                  ],
                ),
              ));
    });
  }
}
