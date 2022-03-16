import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:qrcode_app/shared/themes/app_colors.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrcode_app/shared/themes/app_images.dart';

class QRCodeReader extends StatefulWidget {
  @override
  _QRCodeReaderState createState() => _QRCodeReaderState();
}

class _QRCodeReaderState extends State<QRCodeReader> {
  TextEditingController _editingController = TextEditingController();
  double data = 10;

  @override
  Widget build(BuildContext context) {
    var size = (MediaQuery.of(context).size);
    var screenHeight = (size.height - MediaQuery.of(context).padding.top);
    return Scaffold(
      backgroundColor: AppColors.PrimaryPurple,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: size.width * 0.5,
                  height: screenHeight * 0.4,
                  decoration: BoxDecoration(
                    //color: Colors.amber,
                    image:
                        DecorationImage(image: AssetImage(AppImages.Capivara)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Container(
                    child: QrImage(
                      data: '$data',
                      foregroundColor: Colors.white,
                      version: QrVersions.auto,
                      size: screenHeight * 0.35,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: size.width * 0.80,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: _editingController,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.white),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                                //teste
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                )),
                            labelText: 'Insira o valor para gerar o QR Code',
                            labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                            fillColor: Colors.white,
                          ),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      width: size.width * 0.80,
                      height: screenHeight * 0.07,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            var number = double.parse(_editingController.text);
                            if (number < 0 || number % 1 != 0) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext) {
                                    return AlertDialog(
                                      title: Text('Atenção!'),
                                      content: Text(
                                          'Coloque apenas números INTEIROS e POSITIVOS!'),
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('Fechar'))
                                      ],
                                    );
                                  });
                            } else {
                              data = number;
                            }
                          });
                        },
                        child: Text('Gerar QR Code'),
                        style: ElevatedButton.styleFrom(
                          primary: AppColors.ButtonColor1,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
