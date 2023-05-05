// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:animated_qr_code_scanner/AnimatedQRViewController.dart';
import 'package:animated_qr_code_scanner/animated_qr_code_scanner.dart';
import 'package:flutter/material.dart';

class QRCodePage extends StatefulWidget {
  const QRCodePage({Key? key}) : super(key: key);

  @override
  State<QRCodePage> createState() => _QRCodePageState();
}

class _QRCodePageState extends State<QRCodePage> {
  final AnimatedQRViewController controller = AnimatedQRViewController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("QRCODE"),
          actions: const [],
        ),
        body: Column(
          children: [
            Expanded(
              child: AnimatedQRView(
                squareColor: Colors.green.withOpacity(0.3),
                animationDuration: const Duration(milliseconds: 400),
                onScanBeforeAnimation: (String str) {
                  print('di scan hasilnya $str');
                },
                onScan: (String str) async {
                  await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Hasil Scan"),
                      actions: [
                        FlatButton(
                          child: Text(" HEHEHEHE "),
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Scaffold(
                                  body: Align(
                                    alignment: Alignment.center,
                                    child: Text("$str"),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            controller.resume();
                          },
                          child: Text("Rescan"),
                        ),
                      ],
                    ),
                  );
                },
                controller: controller,
              ),
            ),
          ],
        ));
  }
}
