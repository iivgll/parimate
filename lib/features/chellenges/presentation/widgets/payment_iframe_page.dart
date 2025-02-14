import 'dart:ui_web';

import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'dart:ui' as ui;
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
  final String viewId =
      'payment-iframe-${DateTime.now().millisecondsSinceEpoch}';

  @override
  void initState() {
    super.initState();
    // Регистрируем view
    platformViewRegistry.registerViewFactory(
      viewId,
      (int viewId) {
        final iframe = html.IFrameElement()
          ..src = widget.paymentUrl
          ..style.border = 'none'
          ..style.width = '100%'
          ..style.height = '100%';

        // Слушаем изменения URL
        iframe.onLoad.listen((event) {
          final currentUrl = iframe.contentWindow?.location.toString();
          if (currentUrl != null &&
              currentUrl.contains('yoomoney.ru/checkout/payments/v2/success')) {
            Navigator.of(context).pop(true);
          }
        });

        return iframe;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        leading: IconButton(
          icon: const Icon(Icons.close, color: AppColors.white),
          onPressed: () => Navigator.pop(context, false),
        ),
        title: const Text(
          'Оплата',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: HtmlElementView(viewType: viewId),
    );
  }
}
