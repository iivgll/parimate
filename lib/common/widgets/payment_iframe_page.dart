import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import '../utils/colors.dart';

class PaymentIframePage extends StatefulWidget {
  final String paymentUrl;

  const PaymentIframePage({
    super.key,
    required this.paymentUrl,
  });

  @override
  State<PaymentIframePage> createState() => _PaymentIframePageState();
}

class _PaymentIframePageState extends State<PaymentIframePage> {
  @override
  void initState() {
    super.initState();
    _redirectToPayment();
  }

  void _redirectToPayment() {
    // Подписываемся на изменения URL
    html.window.onPopState.listen((event) {
      if (html.window.location.href
          .contains('yoomoney.ru/checkout/payments/v2/success')) {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pop(true);
      }
    });

    // Переходим на страницу оплаты
    html.window.location.href = widget.paymentUrl;
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.black,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
