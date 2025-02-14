import 'package:flutter/material.dart';
import 'dart:html' as html;
import '../../../../common/utils/colors.dart';

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
    // Сохраняем текущий URL для возврата
    final currentUrl = html.window.location.href;

    // Подписываемся на изменения URL
    html.window.onPopState.listen((event) {
      if (html.window.location.href
          .contains('yoomoney.ru/checkout/payments/v2/success')) {
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
