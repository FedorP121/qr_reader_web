import 'package:flutter/material.dart';

import 'package:qrcode_reader_web/qrcode_reader_web.dart';

void main() {
  runApp(QrCodeScreen());
}

/// {@template qr_code_screen}
/// QrCodeScreen widget.
/// {@endtemplate}
class QrCodeScreen extends StatefulWidget {
  /// {@macro qr_code_screen}
  const QrCodeScreen({
    super.key, // ignore: unused_element
  });

  @override
  State<QrCodeScreen> createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  String result = 'empty';
  final List<QRCodeCapture> list = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          final data = list[index];
                          return Text(data.raw);
                        })),
                Expanded(
                  child: QRCodeReaderTransparentWidget(
                    onDetect: (QRCodeCapture capture) => setState(() {
                      list.add(capture);
                      print('scan completed');
                    }),
                    targetSize: 250,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
